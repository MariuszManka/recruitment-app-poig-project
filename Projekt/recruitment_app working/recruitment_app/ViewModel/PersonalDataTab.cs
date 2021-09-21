using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;

namespace recruitment_app.ViewModel
{
    using Model;
    using DAL.Entities;
    using BaseClass;
    using System.Collections.ObjectModel;
    using System.Windows;

    class PersonalDataTab : ViewModelBase
    {
        private Model model = null;
        private ObservableCollection<PersonalData> personalDataCollection = null;
        private string name, surname, type, country, city, postalCode, pesel, phoneNumber, email, street;
        private int? houseNumber, apartmentNumber;
        private char sex;


        public PersonalDataTab(Model model)
        {
            this.model = model;
            personalDataCollection = model.PersonalDataCollection;

            name = personalDataCollection[0].Name;
            surname = personalDataCollection[0].Surname;
            type = personalDataCollection[0].Type;
            sex = personalDataCollection[0].Sex;
            country = personalDataCollection[0].Country;
            city = personalDataCollection[0].City;
            postalCode = personalDataCollection[0].PostalCode;
            pesel = personalDataCollection[0].Pesel;
            phoneNumber = personalDataCollection[0].PhoneNumber;
            email = personalDataCollection[0].Email;
            street = personalDataCollection[0].Street;
            houseNumber = personalDataCollection[0].HouseNumber;
            apartmentNumber = personalDataCollection[0].ApartmentNumber;
        }

        public ObservableCollection<PersonalData> PersonalDataCollection
        {
            get { return personalDataCollection; }
            set
            {
                personalDataCollection = value;
                onPropertyChanged(nameof(PersonalDataCollection));
            }
        }

        #region Properties 
        public string Name
        {
            get { return name; }
            set
            {
                name = value;
                onPropertyChanged(nameof(Name));
            }
        }
        public string Surname
        {
            get { return surname; }
            set
            {
                surname = value;
                onPropertyChanged(nameof(Surname));
            }
        }
        public string Type
        {
            get { return type; }
            set
            {
                type = value;
                onPropertyChanged(nameof(Type));
            }
        }
        public char Sex
        {
            get { return sex; }
            set
            {
                sex = value;
                onPropertyChanged(nameof(Sex));
            }
        }
        public string Country
        {
            get { return country; }
            set
            {
                country = value;
                onPropertyChanged(nameof(Country));
            }
        }
        public string City
        {
            get { return city; }
            set
            {
                city = value;
                onPropertyChanged(nameof(City));
            }
        }

        public string PostalCode
        {
            get { return postalCode; }
            set
            {
                postalCode = value;
                onPropertyChanged(nameof(PostalCode));
            }
        }
        public string Pesel
        {
            get { return pesel; }
            set
            {
                pesel = value;
                onPropertyChanged(nameof(Pesel));
            }
        }
        public string PhoneNumber
        {
            get { return phoneNumber; }
            set
            {
                phoneNumber = value;
                onPropertyChanged(nameof(PhoneNumber));
            }
        }
        public string Email
        {
            get { return email; }
            set
            {
                email = value;
                onPropertyChanged(nameof(Email));
            }
        }
        public string Street
        {
            get { return street; }
            set
            {
                street = value;
                onPropertyChanged(nameof(Street));
            }
        }

        public int? HouseNumber
        {
            get { return houseNumber; }
            set
            {
                houseNumber = (int?)value;
                onPropertyChanged(nameof(HouseNumber));
            }
        }
        public int? ApartmentNumber
        {
            get { return apartmentNumber; }
            set
            {
                apartmentNumber = (int?)value;
                onPropertyChanged(nameof(ApartmentNumber));
            }
        }
        #endregion

        #region Commands
        private void CleanFormAfterAdd()
        {
            Name = personalDataCollection[0].Name;
            Surname = personalDataCollection[0].Surname;
            Type = personalDataCollection[0].Type;
            Sex = personalDataCollection[0].Sex;
            Country = personalDataCollection[0].Country;
            City = personalDataCollection[0].City;
            PostalCode = personalDataCollection[0].PostalCode;
            Pesel = personalDataCollection[0].Pesel;
            PhoneNumber = personalDataCollection[0].PhoneNumber;
            Email = personalDataCollection[0].Email;
            Street = personalDataCollection[0].Street;
            HouseNumber = personalDataCollection[0].HouseNumber;
            ApartmentNumber = personalDataCollection[0].ApartmentNumber;

        }
        private ICommand cleanForm = null;
        public ICommand CleanForm
        {
            get
            {
                if (cleanForm == null)
                    cleanForm = new RelayCommand(
                        arg =>
                        {
                            CleanFormAfterAdd();
                        }
                        ,
                        null
                        );

                return cleanForm;
            }
        }

        private ICommand editOnePersonalData = null;

        public ICommand EditOnePersonalData
        {
            
            get
            {

                if (editOnePersonalData == null)
                    editOnePersonalData = new RelayCommand(
                        arg =>
                        {
                            var personalData = new PersonalData(Name, Surname, Type, Sex, Country, City, PostalCode, Pesel, PhoneNumber, Email, Street, HouseNumber, ApartmentNumber);

                            if (model.EditPersonalData(personalData))
                            {
                                CleanFormAfterAdd();
                                System.Windows.MessageBox.Show("Your profile has been successfully updated!");
                            }
                        }
                        ,
                        arg => (Country != personalDataCollection[0].Country) || (City != personalDataCollection[0].City) || (PostalCode != personalDataCollection[0].PostalCode) ||
                               (Pesel != personalDataCollection[0].Pesel) || (PhoneNumber != personalDataCollection[0].PhoneNumber) || (Email != personalDataCollection[0].Email) ||
                               (Street != personalDataCollection[0].Street) || (HouseNumber != personalDataCollection[0].HouseNumber) || (ApartmentNumber != personalDataCollection[0].ApartmentNumber)
                        );


                return editOnePersonalData;
            }

        }

        #endregion
    }

}
