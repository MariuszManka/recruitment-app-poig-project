using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using recruitment_app.View;


namespace recruitment_app
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        public MainWindow()
        {
            InitializeComponent();

        }

        private void znajomi_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void NavigationViewControl_SelectionChanged(ModernWpf.Controls.NavigationView sender, ModernWpf.Controls.NavigationViewSelectionChangedEventArgs args)
        {
        }

        private void NavigationViewControl_Loaded(object sender, RoutedEventArgs e)
        {
        }

        private void BtnClick0(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Content = new Page0();
        }
        private void BtnClick1(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Content = new Page1();
        }
        private void BtnClick2(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Content = new Page2();
        }
    }
}