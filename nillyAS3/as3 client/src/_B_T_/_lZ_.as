package _B_T_
{
   import flash.display.Sprite;
   import _05g._1S_m;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _lZ_ extends Sprite
   {
       
      
      protected const h_:int = 36;
      
      protected var _072:Vector.<String>;
      
      protected var w_:int = 0;
      
      protected var selected_:_B_T_._0vP_;
      
      private var _uB_:Vector.<_B_T_._0vP_>;
      
      private var _1pM_:Sprite;
      
      private var _01T_:_1S_m;
      
      public function _lZ_(param1:Vector.<String>)
      {
         this._uB_ = new Vector.<_B_T_._0vP_>();
         this._1pM_ = new Sprite();
         this._01T_ = new _1S_m();
         super();
         this._072 = param1;
         this._1df();
         this._1B_D_();
         addChild(this._1pM_);
         this._1pM_.visible = false;
         this._01T_.complete.addOnce(this.onComplete);
      }
      
      public function getValue() : String
      {
         return this.selected_.getValue();
      }
      
      public function setValue(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = this._072.indexOf(param1);
         if(_loc3_ > 0)
         {
            _loc2_ = this._072[0];
            this._072[_loc3_] = _loc2_;
            this._072[0] = param1;
            this._1B_D_();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function _1qJ_() : int
      {
         return this.h_;
      }
      
      private function _1df() : void
      {
         var _loc1_:_B_T_._0vP_ = null;
         if(this._072.length > 0)
         {
            _loc1_ = this._W_r(this._072[0]);
            this._uB_.push(_loc1_);
            this.selected_ = _loc1_;
            this.selected_.addEventListener(MouseEvent.CLICK,this._1k9);
            addChild(this.selected_);
         }
         var _loc2_:int = 1;
         while(_loc2_ < this._072.length)
         {
            _loc1_ = this._W_r(this._072[_loc2_]);
            _loc1_.addEventListener(MouseEvent.CLICK,this.onSelect);
            _loc1_.y = this.h_ * _loc2_;
            this._uB_.push(_loc1_);
            this._1pM_.addChild(_loc1_);
            _loc2_++;
         }
      }
      
      private function _W_r(param1:String) : _B_T_._0vP_
      {
         var _loc2_:_B_T_._0vP_ = new _B_T_._0vP_(param1,0,this.h_);
         this._01T_.push(_loc2_._1pv());
         return _loc2_;
      }
      
      private function _1B_D_() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._072.length)
         {
            this._uB_[_loc1_].setValue(this._072[_loc1_]);
            this._uB_[_loc1_].setWidth(this.w_);
            _loc1_++;
         }
         if(this._uB_.length > 0)
         {
            this.selected_ = this._uB_[0];
         }
      }
      
      private function _V_c() : void
      {
         this.addEventListener(MouseEvent.ROLL_OUT,this._0A_4);
         this._1pM_.visible = true;
      }
      
      private function _J_O_() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OUT,this._0A_4);
         this._1pM_.visible = false;
      }
      
      private function onComplete() : void
      {
         var _loc1_:_B_T_._0vP_ = null;
         var _loc2_:int = 83;
         for each(_loc1_ in this._uB_)
         {
            _loc2_ = Math.max(_loc1_.width,_loc2_);
         }
         this.w_ = _loc2_;
         this._1B_D_();
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this.selected_.removeEventListener(MouseEvent.CLICK,this._1k9);
         this.selected_.addEventListener(MouseEvent.CLICK,this.onSelect);
         this._V_c();
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this.selected_.addEventListener(MouseEvent.CLICK,this._1k9);
         this.selected_.removeEventListener(MouseEvent.CLICK,this.onSelect);
         this._J_O_();
         var _loc2_:_B_T_._0vP_ = param1.target as _B_T_._0vP_;
         this.setValue(_loc2_.getValue());
      }
      
      private function _0A_4(param1:MouseEvent) : void
      {
         this.selected_.addEventListener(MouseEvent.CLICK,this._1k9);
         this.selected_.removeEventListener(MouseEvent.CLICK,this.onSelect);
         this._J_O_();
      }
   }
}
