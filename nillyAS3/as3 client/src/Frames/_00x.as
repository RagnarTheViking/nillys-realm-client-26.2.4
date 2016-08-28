package Frames
{
   import flash.display.Sprite;
   import _05g._1S_m;
   import _K_t._J_M_;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import _K_t._fr;
   import flash.display.DisplayObject;
   import _E_Y_._1zZ_;
   import _1un.Layout;
   
   public class _00x extends Sprite
   {
       
      
      private const _01T_:_1S_m = new _1S_m();
      
      private var _aE_:Vector.<String>;
      
      private var _1E_q:Vector.<Frames._1X_o>;
      
      private var group:_J_M_;
      
      public function _00x(param1:Vector.<String>)
      {
         super();
         this._aE_ = param1;
         this._01T_.complete.add(this._0fA_);
         this._m5();
         this._0fA_();
         this._0Z_H_();
      }
      
      public function setSelected(param1:String) : void
      {
         this.group.setSelected(param1);
      }
      
      public function _1H_j() : String
      {
         return this.group._1H_j().getValue();
      }
      
      private function _m5() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = this._aE_.length;
         this._1E_q = new Vector.<Frames._1X_o>(_loc1_,true);
         while(_loc2_ < _loc1_)
         {
            this._1E_q[_loc2_] = this._0A_L_(this._aE_[_loc2_]);
            _loc2_++;
         }
      }
      
      private function _0A_L_(param1:String) : Frames._1X_o
      {
         var _loc2_:Frames._1X_o = new Frames._1X_o(param1);
         _loc2_.addEventListener(MouseEvent.CLICK,this._1Q_3);
         this._01T_.push(_loc2_._1bE_);
         addChild(_loc2_);
         return _loc2_;
      }
      
      private function _1Q_3(param1:Event) : void
      {
         var _loc2_:_fr = param1.currentTarget as _fr;
         this.group.setSelected(_loc2_.getValue());
      }
      
      private function _0fA_() : void
      {
         var _loc1_:Vector.<DisplayObject> = this._1A_y();
         var _loc2_:Layout = new _1zZ_();
         _loc2_._1gC_(20);
         _loc2_.layout(_loc1_);
      }
      
      private function _1A_y() : Vector.<DisplayObject>
      {
         var _loc3_:int = 0;
         var _loc1_:int = this._1E_q.length;
         var _loc2_:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
         while(_loc3_ < _loc1_)
         {
            _loc2_[_loc3_] = this._1E_q[_loc3_];
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function _0Z_H_() : void
      {
         var _loc1_:Vector.<_fr> = this._1A_L_();
         this.group = new _J_M_(_loc1_);
         this.group.setSelected(this._1E_q[0].getValue());
      }
      
      private function _1A_L_() : Vector.<_fr>
      {
         var _loc3_:int = 0;
         var _loc1_:int = this._1E_q.length;
         var _loc2_:Vector.<_fr> = new Vector.<_fr>(0);
         while(_loc3_ < _loc1_)
         {
            _loc2_[_loc3_] = this._1E_q[_loc3_];
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
