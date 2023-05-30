using Newtonsoft.Json;

namespace DBWApp.Model
{
    public class Area
    {
        public int Id { get; set; }

        [JsonProperty("nazwa")]
        public string? Name { get; set; }

        [JsonProperty("id-nadrzedny-element")]
        public int? IdSuperiorElement { get; set; }

        [JsonProperty("id-poziom")]
        public int IdLevel { get; set; }

        [JsonProperty("nazwa-poziom")]
        public string? NameLevel { get; set; }

        [JsonProperty("czy-zmienne")]
        public bool? DoesVariables { get; set; }
    }
}
