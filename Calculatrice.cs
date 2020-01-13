using System;

namespace Les_fonctions
{
    class Program
    {
        public static float Add(float f1, float f2)
        {
            return f1 + f2;
        }

        public static float Subtract(float f1, float f2)
        {
            return f1 - f2;
        }

        public static float Divide(float f1, float f2)
        {
            return f1 / f2;
        }

        public static float Multiply(float f1, float f2)
        {
            return f1 * f2;
        }

        public static float Modulo(float f1, float f2)
        {
            return f1 % f2;
        }

        static void Main(string[] args)
        {
                float firstOperand;
                float secondOperand;
                string operation;
                Console.WriteLine("first operand :");
                firstOperand = Convert.ToSingle(Console.ReadLine());
                Console.WriteLine("second operand :");
                secondOperand = Convert.ToSingle(Console.ReadLine());
                Console.WriteLine("which operation you choose:");
                operation = Console.ReadLine().ToLower();
                switch (operation)
                {
                    case "add":
                        Console.WriteLine("" + firstOperand + " + " + secondOperand + " = " + Add(firstOperand, secondOperand));
                        break;
                    case "subtract":
                        Console.WriteLine("" + firstOperand + " - " + secondOperand + " = " + Subtract(firstOperand, secondOperand));
                        break;
                    case "divide":
                        Console.WriteLine("" + firstOperand + " / " + secondOperand + " = " + Divide(firstOperand, secondOperand));
                        break;
                    case "multiply":
                        Console.WriteLine("" + firstOperand + " x " + secondOperand + " = " + Multiply(firstOperand, secondOperand));
                        break;
                    case "modulo":
                        Console.WriteLine("" + firstOperand + " mod " + secondOperand + " = " + Modulo(firstOperand, secondOperand));
                        break;

                }



            }
    }
}
