using System;
using System.Collections.Generic;
using System.Linq;

namespace POO___2._Les_extensions_IEnumerable
{
    class Program
    {
        static void Main(string[] args)
        {;
            Random randomGenerateur = new Random();
            Console.WriteLine("Enter number :");
            int n = Convert.ToInt32(Console.ReadLine());

            int nbvaleur = 25;
            List<int> tabInt = new List<int>();
            for(int i = 0; i< nbvaleur; i++)
            {
                tabInt.Add(randomGenerateur.Next(0,100));
            }

            double moyenne = tabInt.Where((x) => x < n).Average();
            Console.WriteLine(string.Join(' ', tabInt));

            Console.WriteLine("Mean (n < {0}) = {1}", n, moyenne);


        }
    }
}
