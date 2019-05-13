using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    public class TelephoneJson
    {
        public string resultcode { get; set; }

        public string reason { get; set; }

        public result result { get; set; }

        public int error_code { get; set; }
    }

    public class result
    {
        public string province { get; set; }

        public string city { get; set; }

        public string areacode { get; set; }

        public string zip { get; set; }

        public string company { get; set; }

        public string card { get; set; }

    }

    public class ProCityInfo
    {
        public string province { get; set; }

        public string city { get; set; }
    }
}
