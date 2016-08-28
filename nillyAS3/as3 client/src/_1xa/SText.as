package _1xa
{
   import _03U_._1U_N_;
   
   public class SText implements _1eo
   {
       
      
      private var string:String;
      
      private var prefix:String;
      
      private var postfix:String;
      
      public function SText(param1:String = "")
      {
         super();
         this.string = param1;
         this.prefix = "";
         this.postfix = "";
      }
      
      public function setString(param1:String) : SText
      {
         this.string = param1;
         return this;
      }
      
      public function setPrefix(param1:String) : SText
      {
         this.prefix = param1;
         return this;
      }
      
      public function setPostfix(param1:String) : SText
      {
         this.postfix = param1;
         return this;
      }
      
      public function _0L_b(param1:_1U_N_) : void
      {
      }
      
      public function getString() : String
      {
         return this.prefix + this.string + this.postfix;
      }
   }
}
