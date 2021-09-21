using System;
using System.Collections.Generic;
using System.Text;
using MySql.Data.MySqlClient;

namespace recruitment_app.DAL.Entities
{
    class PersonalData
    {
        #region Properties
        public sbyte? Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Type { get; set; }
        public char Sex { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string Pesel { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Street { get; set; }
        public int? HouseNumber { get; set; }
        public int? ApartmentNumber { get; set; }
        #endregion

        #region Constructors
        public PersonalData(MySqlDataReader reader)
        {
            Id = sbyte.Parse(reader["ID"].ToString());
            Name = reader["name"].ToString();
            Surname = reader["surname"].ToString();
            Type = reader["type"].ToString();
            Sex = char.Parse(reader["sex"].ToString());
            Country = reader["country"].ToString();
            City = reader["city"].ToString();
            PostalCode = reader["postal_code"].ToString();
            Pesel = reader["PESEL"].ToString();
            PhoneNumber = reader["phone_number"].ToString();
            Email = reader["e_mail"].ToString();
            Street = reader["street"].ToString();
            HouseNumber = (reader["house_number"] == null) ? int.Parse(reader["house_number"].ToString()) : (int?)null;
            ApartmentNumber = (reader["apartment_number"] == null) ? int.Parse(reader["apartment_number"].ToString()) : (int?)null;
        }

        public PersonalData(string name, string surname, string type, char sex, string country, string city, string postalCode, string pesel, string phoneNumber, string email, string street, int? houseNumber, int? apartamentNumber)
        {
            Id = null;
            Name = name.Trim();
            Surname = surname.Trim();
            Type = type.Trim();
            Sex = sex;
            Country = country.Trim();
            City = city.Trim();
            PostalCode = postalCode.Trim();
            Pesel = pesel.Trim();
            PhoneNumber = phoneNumber.Trim();
            Email = email.Trim();
            Street = street.Trim();
            HouseNumber = houseNumber;
            ApartmentNumber = apartamentNumber;
        }
        public PersonalData(PersonalData personalData)
        {
            Id = null;
            Name = personalData.Name.Trim();
            Surname = personalData.Surname.Trim();
            Type = personalData.Type.Trim();
            Sex = personalData.Sex;
            Country = personalData.Country.Trim();
            City = personalData.City.Trim();
            PostalCode = personalData.PostalCode.Trim();
            Pesel = personalData.Pesel.Trim();
            PhoneNumber = personalData.PhoneNumber.Trim();
            Email = personalData.Email.Trim();
            Street = personalData.Street.Trim();
            HouseNumber = personalData.HouseNumber;
            ApartmentNumber = personalData.ApartmentNumber;
        }
        #endregion
    }
}
