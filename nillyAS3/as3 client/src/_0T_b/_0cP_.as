package _0T_b
{
   import Frames.Frame;
   import _f7.Signal;
   import Frames.TextInput;
   import _C_._1O_I_;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   
   public class _0cP_ extends Frame
   {
       
      
      public var cancel:Signal;
      
      public var change:Signal;
      
      public var password_:TextInput;
      
      public var _0J_I_:TextInput;
      
      public var _T_r:TextInput;
      
      public function _0cP_()
      {
         super(_1O_I_._i7,"",_1O_I_._1X_p,"/changePassword");
         this.password_ = new TextInput(_1O_I_._I_H_,true);
         _O_n(this.password_);
         this._0J_I_ = new TextInput(_1O_I_._1T_H_,true);
         _O_n(this._0J_I_);
         this._T_r = new TextInput(_1O_I_._1V_g,true);
         _O_n(this._T_r);
         this.change = new NativeMappedSignal(actionButton,MouseEvent.CLICK);
      }
      
      private function _hf() : Boolean
      {
         var _loc1_:* = this.password_.text().length >= 5;
         if(!_loc1_)
         {
            this.password_.setErrorText(_1O_I_._1qn);
         }
         return _loc1_;
      }
      
      private function _1kr() : Boolean
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:* = this._0J_I_.text().length >= 10;
         if(!_loc3_)
         {
            this._0J_I_.setErrorText(_1O_I_._1I_7);
         }
         else
         {
            _loc1_ = this._0J_I_.text();
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length - 2)
            {
               if(_loc1_.charAt(_loc2_) == _loc1_.charAt(_loc2_ + 1) && _loc1_.charAt(_loc2_ + 1) == _loc1_.charAt(_loc2_ + 2))
               {
                  this._0J_I_.setErrorText(_1O_I_._1I_7);
                  _loc3_ = false;
               }
               _loc2_++;
            }
         }
         return _loc3_;
      }
      
      private function _0G_0() : Boolean
      {
         var _loc1_:* = this._0J_I_.text() == this._T_r.text();
         if(!_loc1_)
         {
            this._T_r.setErrorText(_1O_I_._0C_V_);
         }
         return _loc1_;
      }
      
      public function _0gM_(param1:String) : void
      {
         this.password_.setErrorText(param1);
      }
      
      public function _0uq() : void
      {
         this.password_.clearErrorText();
         this._T_r.clearErrorText();
         this._0J_I_.clearErrorText();
      }
   }
}
