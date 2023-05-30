using DBWApp.Model;
using GalaSoft.MvvmLight.CommandWpf;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Net.Http;
using System.Windows.Data;

namespace DBWApp.ViewModel
{
    public class MainViewModel : INotifyPropertyChanged
    {
        private readonly HttpClient _httpClient = new HttpClient();
        private List<Area> _areas;
        private ICollectionView _areasView;
        private string _searchText;
        public event PropertyChangedEventHandler PropertyChanged;

        public GalaSoft.MvvmLight.CommandWpf.RelayCommand LoadDataCommand { get; }

        public List<Area> Areas
        {
            get { return _areas; }
            set
            {
                _areas = value;
                OnPropertyChanged(nameof(Areas));
            }
        }

        public string SearchText
        {
            get { return _searchText; }
            set
            {
                _searchText = value;
                ApplyFilter();
                OnPropertyChanged(nameof(SearchText));
            }
        }

        public MainViewModel()
        {
            LoadDataCommand = new RelayCommand(LoadData);
        }

        private async void LoadData()
        {
            var response = await _httpClient.GetAsync("https://api-dbw.stat.gov.pl/api/1.1.0/area/area-area");
            var responseContent = await response.Content.ReadAsStringAsync();
            Areas = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Area>>(responseContent);

            _areasView = CollectionViewSource.GetDefaultView(Areas);
            ApplyFilter();

            OnPropertyChanged(nameof(Areas));
        }

        private void ApplyFilter()
        {
            if (_areasView != null)
            {
                if (string.IsNullOrWhiteSpace(SearchText))
                {
                    _areasView.Filter = null;
                    return;
                }
            }

            if (_areasView != null)
            {
                _areasView.Filter = item =>
                {
                    var area = item as Area;
                    if (area == null)
                        return false;
                    return area.Id.ToString().Contains(SearchText, StringComparison.OrdinalIgnoreCase) ||
                           area.Name.Contains(SearchText, StringComparison.OrdinalIgnoreCase) ||
                           area.IdSuperiorElement.ToString().Contains(SearchText, StringComparison.OrdinalIgnoreCase) ||
                           area.IdLevel.ToString().Contains(SearchText, StringComparison.OrdinalIgnoreCase) ||
                           area.NameLevel.Contains(SearchText, StringComparison.OrdinalIgnoreCase) ||
                           area.DoesVariables.ToString().Contains(SearchText, StringComparison.OrdinalIgnoreCase);
                };
            }
        }

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
