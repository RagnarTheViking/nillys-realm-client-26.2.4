package _1gF_
{
   import flash.text.TextField;
   import _03U_._0S_r;
   import _C_._1xG_;
   
   public class _0B_X_ extends TextField
   {
      
      public static const _1v4:uint = 977663;
      
      public static const _1B___:uint = 15874138;
       
      
      public var _1gQ_:_0S_r;
      
      public function _0B_X_()
      {
         super();
      }
      
      override public function set text(param1:String) : void
      {
         super.text = this._1g8(param1);
      }
      
      override public function set htmlText(param1:String) : void
      {
         super.htmlText = this._1g8(param1);
      }
      
      public function _1g8(param1:String) : String
      {
         var _loc2_:_1xG_ = null;
         if(this._1gQ_._1vD_.length)
         {
            _loc2_ = this._1gQ_._1vD_[0];
            if(_loc2_._1Z_q)
            {
               this._04o(_1v4);
            }
            else
            {
               this._04o(_1B___);
            }
            return _loc2_.key;
         }
         return param1;
      }
      
      private function _04o(param1:uint) : void
      {
         background = true;
         backgroundColor = param1;
      }
   }
}
