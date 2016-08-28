package Frames
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.util.offer.Offers;
   import _1V_8._jw;
   import _K_t._J_M_;
   import com.company.assembleegameclient.util.offer.Offer;
   import flash.events.MouseEvent;
   import _K_t._fr;
   import flash.display.DisplayObject;
   import _E_Y_._u6;
   import _1un.Layout;
   
   public class _1U_L_ extends Sprite
   {
       
      
      private var _M_2:Offers;
      
      private var config:_jw;
      
      private var _W_P_:Vector.<Frames._0E_1>;
      
      private var group:_J_M_;
      
      public function _1U_L_(param1:Offers, param2:_jw)
      {
         super();
         this._M_2 = param1;
         this.config = param2;
         this._ph();
         this._i2();
         this._0Z_H_();
      }
      
      public function _s2() : Frames._0E_1
      {
         return this.group._1H_j() as Frames._0E_1;
      }
      
      private function _ph() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = this._M_2.offerList.length;
         this._W_P_ = new Vector.<Frames._0E_1>(_loc1_,true);
         while(_loc2_ < _loc1_)
         {
            this._W_P_[_loc2_] = this._1Q_P_(this._M_2.offerList[_loc2_]);
            _loc2_++;
         }
      }
      
      private function _1Q_P_(param1:Offer) : Frames._0E_1
      {
         var _loc2_:Frames._0E_1 = new Frames._0E_1(param1,this.config);
         _loc2_.addEventListener(MouseEvent.CLICK,this._1Q_3);
         addChild(_loc2_);
         return _loc2_;
      }
      
      private function _1Q_3(param1:MouseEvent) : void
      {
         var _loc2_:_fr = param1.currentTarget as _fr;
         this.group.setSelected(_loc2_.getValue());
      }
      
      private function _i2() : void
      {
         var _loc1_:Vector.<DisplayObject> = this._1c0();
         var _loc2_:Layout = new _u6();
         _loc2_._1gC_(5);
         _loc2_.layout(_loc1_);
      }
      
      private function _1c0() : Vector.<DisplayObject>
      {
         var _loc3_:int = 0;
         var _loc1_:int = this._W_P_.length;
         var _loc2_:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
         while(_loc3_ < _loc1_)
         {
            _loc2_[_loc3_] = this._W_P_[_loc3_];
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function _0Z_H_() : void
      {
         var _loc1_:Vector.<_fr> = this._1A_L_();
         this.group = new _J_M_(_loc1_);
         this.group.setSelected(this._W_P_[0].getValue());
      }
      
      private function _1A_L_() : Vector.<_fr>
      {
         var _loc3_:int = 0;
         var _loc1_:int = this._W_P_.length;
         var _loc2_:Vector.<_fr> = new Vector.<_fr>(0);
         while(_loc3_ < _loc1_)
         {
            _loc2_[_loc3_] = this._W_P_[_loc3_];
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function _f2(param1:Boolean) : void
      {
         var _loc2_:int = this._W_P_.length;
         while(_loc2_--)
         {
            this._W_P_[_loc2_].showBonus(param1);
         }
      }
   }
}
