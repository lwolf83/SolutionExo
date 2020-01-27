using System;

namespace POO___1._Delegates
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            ShowMoney money = ShowEuros;
            money(12.1932);
            money = ShowDollars;
            money(12.1932);

        }

        public delegate void ShowMoney(double value);

        public static void ShowEuros(double value)
        {
            Console.WriteLine("{0:0.00} €", value);
        }

        public static void ShowDollars(double value)
        {
            Console.WriteLine("{0:0.00} $", value);
        }
    }
}
