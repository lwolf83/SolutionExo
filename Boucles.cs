using System;

namespace Les_boucles
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] moves = new string[32];

            int cptMoves = 0;

            string pas = "";

            while(cptMoves < moves.Length && pas != "done")
            {
                Console.WriteLine("Veuillez saisir un nouveau pas :");
                pas = Console.ReadLine().ToLower();
                moves[cptMoves] = pas;
                cptMoves++;

            }

            int nbIteration;
            Console.WriteLine("Combien de fois voulez vous réaliser la dance?");
            nbIteration = Convert.ToInt32(Console.ReadLine());
            
            for(int i = 0; i < nbIteration; i ++)
            {
                cptMoves = 0;
                pas = "";
                while(cptMoves < moves.Length && pas != "done")
                {
                    pas = moves[cptMoves];
                    if(pas != "done")
                    {
                        Console.WriteLine(pas);
                    }
                    cptMoves++;
                }


            }
        }
    }
}
