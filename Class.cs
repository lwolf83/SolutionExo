using System;

namespace Les_class
{
    public class Character
    {
        public string nom;
        public int pv;
        public int attaque;
        public int defense;

        public Boolean IsAlive()
        {
            if(pv > 0)
            {
                return true;
            }
            else { 
                return false; 
            }
        }

        public void Attack(Character attaquant)
        {
            pv = pv - (attaquant.attaque - defense);
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Random randomGenerateur = new Random();

            Character jedi = new Character();
            jedi.pv = randomGenerateur.Next(90, 110); 
            jedi.attaque = randomGenerateur.Next(10, 15);
            jedi.defense = randomGenerateur.Next(5, 10);

            Character sith = new Character();
            sith.pv = randomGenerateur.Next(90, 110);
            sith.attaque = randomGenerateur.Next(10, 15);
            sith.defense = randomGenerateur.Next(5, 10);

            int quiAttaque;
            while(sith.IsAlive() && jedi.IsAlive())
            {
                quiAttaque = randomGenerateur.Next(2);
                if (quiAttaque == 1)
                {
                    
                    jedi.Attack(sith);
                    Console.WriteLine("Le Sith attaque. Il reste " + jedi.pv + " au jedi.");
                }
                else
                {
                    sith.Attack(jedi);
                    Console.WriteLine("Le Jedi attaque. Il reste " + sith.pv + " au Sith.");
                }
            }

            if(sith.IsAlive())
            {
                Console.WriteLine("Ca craind pour la galaxie! Le Sith a gagné!");
            }
            else
            {
                Console.WriteLine("Whouhou!!! Les gentils ont gagné!! Le méchant Sith est mort!");
            }
        }
    }
}
