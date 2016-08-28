package Frames.FancyButton
{
   public class WhiteButtonDesign implements IDesign
   {
       
      
      public function WhiteButtonDesign()
      {
         super();
      }
      
      public function get idleColor() : uint
      {
         return 16777215;
      }
      
      public function get idleGlow() : uint
      {
         return 16777215;
      }
      
      public function get hoverColor() : uint
      {
         return 16777215;
      }
      
      public function get hoverGlow() : uint
      {
         return 16777215;
      }
   }
}
