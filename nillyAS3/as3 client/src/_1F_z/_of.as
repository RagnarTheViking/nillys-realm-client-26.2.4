package _1F_z
{
   public class _of
   {
      
      private static const _1vx:Object = {
         "Humanoid":"Pets.humanoid",
         "Feline":"Pets.feline",
         "Canine":"Pets.canine",
         "Avian":"Pets.avian",
         "Exotic":"Pets.exotic",
         "Farm":"pets.Farm",
         "Woodland":"Pets.woodland",
         "Reptile":"Pets.reptile",
         "Insect":"pets.Insect",
         "Penguin":"pets.Penguin",
         "Aquatic":"Pets.aquatic",
         "Spooky":"Pets.spooky",
         "Automaton":"Pets.automaton"
      };
       
      
      public function _of()
      {
         super();
      }
      
      public static function _1s0(param1:String) : String
      {
         var _loc2_:String = _1vx[param1];
         return _loc2_ || (param1 == "? ? ? ?"?"Pets.miscellaneous":"");
      }
   }
}
