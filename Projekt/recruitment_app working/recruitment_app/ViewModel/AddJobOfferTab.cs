using System;
using System.Collections.Generic;
using System.Text;

namespace recruitment_app.ViewModel
{
    using Model;
    using DAL.Entities;
    using BaseClass;
    using System.Windows.Input;
    using System.Windows;
    using System.Collections.ObjectModel;
    class AddJobOfferTab : ViewModelBase
    {
        private Model model = null;
        private string title, positionName, description, tasks, candidateDescription, requiredSkills, wageRate = "2800", typeOfContract, tags;
        private sbyte id, trialDays, minimalExperience;

        public AddJobOfferTab(Model model)
        {
            this.model = model;
            JobOffers = model.JobOffersCollection;
        }

        public ObservableCollection<JobOffer> JobOffers { get; set; }

        #region Properties 
        public string Title
        {
            get { return title; }
            set
            {
                title = value;
                onPropertyChanged(nameof(Title));
            }
        }
        public string PositionName
        {
            get { return positionName; }
            set
            {
                positionName = value;
                onPropertyChanged(nameof(PositionName));
            }
        }
        public string Description
        {
            get { return description; }
            set
            {
                description = value;
                onPropertyChanged(nameof(Description));
            }
        }
        public string Tasks
        {
            get { return tasks; }
            set
            {
                tasks = value;
                onPropertyChanged(nameof(Tasks));
            }
        }

        public string CandidateDescription
        {
            get { return candidateDescription; }
            set
            {
                candidateDescription = value;
                onPropertyChanged(nameof(CandidateDescription));
            }
        }
        public string RequiredSkills
        {
            get { return requiredSkills; }
            set
            {
                requiredSkills = value;
                onPropertyChanged(nameof(RequiredSkills));
            }
        }
        public string WageRate
        {
            get { return wageRate; }
            set
            {
                wageRate = value;
                onPropertyChanged(nameof(WageRate));
            }
        }
        public string TypeOfContract
        {
            get { return typeOfContract; }
            set
            {
                typeOfContract = value;
                onPropertyChanged(nameof(TypeOfContract));
            }
        }
        public string Tags
        {
            get { return tags; }
            set
            {
                tags = value;
                onPropertyChanged(nameof(Tags));
            }
        }

        public sbyte ID
        {
            get { return id; }
            set
            {
                id = value;
                onPropertyChanged(nameof(ID));
            }
        }
        public sbyte TrialDays
        {
            get { return trialDays; }
            set
            {
                trialDays = value;
                onPropertyChanged(nameof(TrialDays));
            }
        }
        public sbyte MinimalExperience
        {
            get { return minimalExperience; }
            set
            {
                minimalExperience = value;
                onPropertyChanged(nameof(MinimalExperience));
            }
        }
        #endregion

        #region Commands
        private void CleanFormAfterAdd()
        {
            Title = "";
            PositionName = "";
            Description = "";
            Tasks = "";
            CandidateDescription = "";
            RequiredSkills = "";
            WageRate = "2800";
            TrialDays = 0;
            MinimalExperience = 0;
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

        /// <summary>
        /// Polecenie Dodaj odpowiedzialne za dodane nowek osoby do bazy danych
        /// </summary>
        private ICommand addJobOffer = null;

        public ICommand AddJobOffer
        {

            get
            {
                if (addJobOffer == null)
                    addJobOffer = new RelayCommand(
                        arg =>
                        {
                            var jobOffer = new JobOffer(Title, PositionName, Description, Tasks, CandidateDescription, RequiredSkills, WageRate, TrialDays, MinimalExperience);

                            if (model.AddJobOfferToDatabase(jobOffer))
                            {
                                CleanFormAfterAdd();
                                System.Windows.MessageBox.Show("Job offer successfully added!");
                            }
                        }
                        ,
                        arg => (Title != "") && (PositionName != "") && (Tasks != "") && (CandidateDescription != "")
                        );


                return addJobOffer;
            }

        }

        #endregion
    }
}
