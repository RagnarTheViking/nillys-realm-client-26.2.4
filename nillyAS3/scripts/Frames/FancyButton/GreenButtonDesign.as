package Frames.FancyButton
{
   public class GreenButtonDesign implements IDesign
   {
       
      
      public function GreenButtonDesign()
      {
         super();
      }
      
      public function get idleColor() : uint
      {
         return 65280;
      }
      
      public function get idleGlow() : uint
      {
         return 65280;
      }
      
      public function get hoverColor() : uint
      {
         return 65280;
      }
      
      public function get hoverGlow() : uint
      {
         return 65280;
      }
   }
}
