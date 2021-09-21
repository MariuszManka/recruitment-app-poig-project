using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using MySql.Data.MySqlClient;


namespace recruitment_app.DAL.Entities
{
    class JobOffer
    {
        #region Properties
        public sbyte? Id { get; set; }
        public string Title { get; set; }
        public string PostionName { get; set; }
        public string Description { get; set; }
        public string Tasks { get; set; }
        public string CandidateDescription { get; set; }
        public string RequiredSkills { get; set; }
        public string WageRate { get; set; }
        public string TypeOfContract { get; set; }
        public sbyte TrialDays { get; set; }
        public sbyte MinimalExperience { get; set; }
        public string Tags { get; set; }
        public sbyte RecruitersId { get; set; }
        #endregion

        #region Constructors
        public JobOffer(MySqlDataReader reader)
        {
            Id = sbyte.Parse(reader["ID_Aplikacji"].ToString());
            Title = reader["title"].ToString();
            PostionName = reader["position_name"].ToString();
            Description = reader["description"].ToString();
            Tasks = reader["Tasks"].ToString();
            CandidateDescription = reader["candidate_description"].ToString();
            RequiredSkills = reader["required_skills"].ToString();
            WageRate = reader["wage_rate"].ToString();
            TypeOfContract = reader["type_of_contract"].ToString();
            TrialDays = sbyte.Parse(reader["trial_days"].ToString()); 
            MinimalExperience = sbyte.Parse(reader["minimal_experience"].ToString());
            Tags = reader["tags"].ToString();
            RecruitersId = sbyte.Parse(reader["recruiters_id"].ToString());
        }

        public JobOffer(string title, string postionName, string description, string tasks, string candidateDescription, string requiredSkills, string wageRate, sbyte trialDays, sbyte minimalExperience)
        {
            Id = null;
            Title = title.Trim();
            PostionName = postionName.Trim();
            Description = description.Trim();
            Tasks = tasks.Trim();
            CandidateDescription = candidateDescription.Trim();
            RequiredSkills = requiredSkills.Trim();
            WageRate = wageRate;
            TrialDays = trialDays;
            MinimalExperience = minimalExperience;
        }
        public JobOffer(JobOffer jobOffer)
        {
            Id = null;
            Title = jobOffer.Title.Trim();
            PostionName = jobOffer.PostionName.Trim();
            Description = jobOffer.Description.Trim();
            Tasks = jobOffer.Tasks.Trim();
            CandidateDescription = jobOffer.CandidateDescription.Trim();
            RequiredSkills = jobOffer.RequiredSkills.Trim();
            WageRate = jobOffer.WageRate;
            TrialDays = jobOffer.TrialDays;
            MinimalExperience = jobOffer.MinimalExperience;
        }
        #endregion
        //Dla metody INSERT TO z SQL
        public string ToInsert()
        {
            return $" ('', '{Title}', '{PostionName}', '{Description}', '{Tasks}', '{CandidateDescription}', '{RequiredSkills}', '{WageRate}', '', '{TrialDays}', '{MinimalExperience}', '', '', '1' )";
        }

        public override bool Equals(object obj)
        {
            var jobOffer = obj as JobOffer;
            if (jobOffer is null) return false;
            if (jobOffer.Id != Id) return false; //Id dla każdego rekordu jest unikatowe, dlatego porównujemy po Id

            return true;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
