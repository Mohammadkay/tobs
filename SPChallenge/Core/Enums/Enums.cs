using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core
{
    public class Enums
    {
        #region User
        public enum Gender
        {
            Male = 1,
            Female = 2,
            NotSpecified = 3
        }

        public enum UserStatus
        {
            Allowed = 1,
            blocked = 2,
            WrongPassword = 3,
            UnderReview = 4
        }

        public enum UserType
        {
            Admin = 1,
            Player = 2,
            Refree = 3
        }
        #endregion

        #region Stade
        public enum StadeStatus
        {
            Opened = 1,
            Closed = 2,
            Others = 3
        }

        public enum StadeType
        {
            Outdoor = 1,
            Indoor = 2          
        }
        #endregion

        #region Match
        public enum MatchStatus
        {
            All = 0,
            Active =1,
            Finsihed = 2,            
        }
        #endregion

        #region API
        public enum ResultStatus
        {
            Success = 1,
            Fail=0
        }
        #endregion

        #region ImagesTypes
        public enum ImagesTypes
        {
            User = 1,
            Stade = 2,
            StadeService = 3,
            Match = 4,
            Default = 5,
        }
        #endregion

        #region ImagePath
        public class ImagePath
        {
            public static string User = "TempFolder/Images/UserProfileImage/";
            public static string Stade = "TempFolder/Images/Stade/";
            public static string StadeService = "TempFolder/Images/StadeService/";
            public static string Match = "TempFolder/Images/Match/";
            public static string Default = "TempFolder/Images/DefaultImages/";
        }
        #endregion
    }
}
