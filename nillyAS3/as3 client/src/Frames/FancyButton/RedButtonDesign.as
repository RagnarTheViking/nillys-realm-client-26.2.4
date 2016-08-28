package Frames.FancyButton
{
   public class RedButtonDesign implements IDesign
   {
       
      
      public function RedButtonDesign()
      {
         super();
      }
      
      public function get idleColor() : uint
      {
         return 16711680;
      }
      
      public function get idleGlow() : uint
      {
         return 16711680;
      }
      
      public function get hoverColor() : uint
      {
         return 16739950;
      }
      
      public function get hoverGlow() : uint
      {
         return 16739950;
      }
   }
}
