package _03U_
{
   import flash.net.SharedObject;
   import flash.utils.Dictionary;
   
   public class _1__x implements _51
   {
      
      public static const _0H_l:String = "en";
       
      
      private var _1m1:SharedObject;
      
      private var language:String;
      
      private var _1lK_:Dictionary;
      
      public function _1__x()
      {
         this._1lK_ = this._W_4();
         super();
         try
         {
            this._1m1 = SharedObject.getLocal("nRotMG","/");
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      public function _lP_() : String
      {
         return this.language = this.language || this._G_q();
      }
      
      private function _G_q() : String
      {
         return this._1m1.data.locale || _0H_l;
      }
      
      public function _03M_(param1:String) : void
      {
         this.language = param1;
         try
         {
            this._1m1.data.locale = param1;
            this._1m1.flush();
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      public function _S_u() : String
      {
         return this._lP_().substr(0,2).toLowerCase();
      }
      
      public function _1uW_() : Vector.<String>
      {
         var _loc1_:* = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         for(_loc1_ in this._1lK_)
         {
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
      
      public function _P_t(param1:String) : String
      {
         return this._1lK_[param1];
      }
      
      public function _4__(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:* = null;
         for(_loc3_ in this._1lK_)
         {
            if(this._1lK_[_loc3_] == param1)
            {
               _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
      
      private function _W_4() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_["Languages.English"] = "en";
         _loc1_["Languages.French"] = "fr";
         _loc1_["Languages.Spanish"] = "es";
         _loc1_["Languages.Italian"] = "it";
         _loc1_["Languages.German"] = "de";
         _loc1_["Languages.Turkish"] = "tr";
         _loc1_["Languages.Russian"] = "ru";
         return _loc1_;
      }
   }
}
