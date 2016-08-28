package Frames.FancyButton
{
   public class GoldenButtonDesign implements IDesign
   {
       
      
      public function GoldenButtonDesign()
      {
         super();
      }
      
      public function get idleColor() : uint
      {
         return 16750848;
      }
      
      public function get idleGlow() : uint
      {
         return 16750848;
      }
      
      public function get hoverColor() : uint
      {
         return 16567432;
      }
      
      public function get hoverGlow() : uint
      {
         return 16756800;
      }
   }
}
