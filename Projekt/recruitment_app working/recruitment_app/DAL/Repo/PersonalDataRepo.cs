using System;
using System.Collections.Generic;
using System.Text;
using MySql.Data.MySqlClient;

namespace recruitment_app.DAL.Repo
{
    using Entities;
    using System.Windows;
    class PersonalDataRepo
    {
        private const string GET_ONE_PERSONAL_DATA = "SELECT * FROM `personal_data` INNER JOIN recruiters ON personal_data.recruiters_id = recruiters.recruiters_id WHERE ID =@personId";
        private const string UPDATE_ONE_PERSON = "UPDATE `personal_data` SET  `country`=@country, `city`=@city, `postal_code`=@code, `phone_number`=@number, `e_mail`=@mail, `street`=@street, `house_number`=@houseNumber, `apartment_number`=@apartament WHERE `personal_data`.`ID` = @id;";

        public static List<PersonalData> GetOnePersonData(int personId)
        {
            List<PersonalData> person_data = new List<PersonalData>();


            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(GET_ONE_PERSONAL_DATA, connection);
                command.Parameters.Add("@personId", MySqlDbType.Int32);
                command.Parameters["@personId"].Value = personId;
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                        person_data.Add(new PersonalData(reader));
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }

            }
            return person_data;
        }
        public static bool EditPersonalDataInDatabase(PersonalData personalData, int currentPersonId)
        {

            bool state = false;
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(UPDATE_ONE_PERSON, connection);
                command.Parameters.Add("@country", MySqlDbType.String);
                command.Parameters["@country"].Value = personalData.Street;

                command.Parameters.Add("@city", MySqlDbType.String);
                command.Parameters["@city"].Value = personalData.City;

                command.Parameters.Add("@code", MySqlDbType.String);
                command.Parameters["@code"].Value = personalData.PostalCode;

                command.Parameters.Add("@number", MySqlDbType.String);
                command.Parameters["@number"].Value = personalData.PhoneNumber;

                command.Parameters.Add("@mail", MySqlDbType.String);
                command.Parameters["@mail"].Value = personalData.Email;

                command.Parameters.Add("@street", MySqlDbType.String);
                command.Parameters["@street"].Value = personalData.Street;

                command.Parameters.Add("@houseNumber", MySqlDbType.Int32);
                command.Parameters["@houseNumber"].Value = personalData.HouseNumber;

                command.Parameters.Add("@apartament", MySqlDbType.Int32);
                command.Parameters["@apartament"].Value = personalData.ApartmentNumber;

                command.Parameters.Add("@id", MySqlDbType.Int32);
                command.Parameters["@id"].Value = currentPersonId;

                connection.Open();
                var id = command.ExecuteNonQuery();
                state = true;
                connection.Close();
            }
            return state;
        }
    }
}
