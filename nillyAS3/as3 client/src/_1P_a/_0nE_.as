package _1P_a
{
   public class _0nE_
   {
       
      
      private var a:Number;
      
      private var r:Number;
      
      public function _0nE_(param1:Number, param2:Number)
      {
         super();
         this.a = param1;
         this.r = param2;
      }
      
      public function _19K_(param1:int) : Number
      {
         return this.a * (1 - Math.pow(this.r,param1)) / (1 - this.r);
      }
      
      public function _1vN_(param1:int) : Number
      {
         return this.a * Math.pow(this.r,param1);
      }
   }
}
