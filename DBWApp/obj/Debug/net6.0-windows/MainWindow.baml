   M S B A M L   `   `   `  ����A  =DBWApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:DBWApp.ViewModelDBWApp.ViewModel  5   	       DBWApp.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -vmclr-namespace:DBWApp.ViewModel     5   	     � Title$  Table��5   	   $	��500��6   $	��800��6$    � DataContext 5	      $   DBWApp.ViewModel.MainViewModel  5
   
    � 	Resources 5         	CellStyle �� 
TargetType*  $System.Windows.Controls.DataGridCell �� Triggers �� Binding �� Value �� Property �� Value��%�  &	        �� 5   
   "  6"    5      �� 5       6   �� *	NameLevel+ Zakres informacyjny6<   .a�5      ��  � ��
 �  ��63   5      �� 5       6   �� *	NameLevel+	 Temat6<   .a�5      ��  � ��
 � � �63   5      �� 5       6   �� *	NameLevel+ 	Dziedzina6<   .a�5      ��  � ��
 � ���63   5      5      5      .��5      � 	 � RowDefinitions	 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5    
   � $��10q�6   
 � ColumnDefinitions
 5!      �� 5"      $
��Auto �6#   �� 5#      $
��Auto �6#   �� 5$      $��* �6#   .+�5&      �� $��	Load Data��6   $��0,0,10,0q�6M   ��6)   �� *LoadDataCommand+6M   �� 5'       �� Orientation$ 
Horizontal=�6   $��1��62   $��0,0,10,0q�6B   .+�5(      �� $	��200��6   $��0,0,10,0q�6g   ��6&   �� *
SearchText+ �� UpdateSourceTrigger$ PropertyChanged=�6g   5)      5*      &   System.Windows.Controls.DataGrid  5+   
   $��1��61      AutoGenerateColumns$ False��6>   ��6   �� *Areas+   Columns 5,      0  *System.Windows.Controls.DataGridTextColumn  5-      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *Id+  5.      $
 Name��6%    63   �� *Name+  5/      $ ID superior element��6%    6B   �� *IdSuperiorElement+  50      $ ID level��6%    67   �� *	IdLevel+  51      $ 
Name level��6%      	CellStyle# [  6X    69   �� *	NameLevel+6X     52      $ Does variables��6%    6=   �� *DoesVariables+54      55      56      