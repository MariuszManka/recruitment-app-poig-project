using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;


namespace recruitment_app.DAL.Repo
{
    using Entities;
    using System.Windows;

    static class JobOffersRepo
    {
        private const string ALL_JOB_OFFERS = "SELECT * FROM job_offers";
        private const string ADD_JOB_OFFER = "INSERT INTO `job_offers` (`ID_Aplikacji`, `title`, `position_name`, `description`, `Tasks`, `candidate_description`, `required_skills`, `wage_rate`, `type_of_contract`, `trial_days`, `minimal_experience`, `end_of_recruitment`, `tags`, `recruiters_id`) VALUES ";

     public static List<JobOffer> GetAllJobOffers()
        {
            List<JobOffer> all_jobs = new List<JobOffer>();

            
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(ALL_JOB_OFFERS, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                        all_jobs.Add(new JobOffer(reader));
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
               
            }
            return all_jobs;
        }

        public static bool AddJobOfferToDatabase(JobOffer jobOffer)
        {
            
            bool state = false;
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand($"{ADD_JOB_OFFER} {jobOffer.ToInsert()}", connection);
                connection.Open();
                var id = command.ExecuteNonQuery();
                state = true;
                jobOffer.Id = (sbyte)command.LastInsertedId;
                connection.Close();
            }
            return state;
        }
    }
}
