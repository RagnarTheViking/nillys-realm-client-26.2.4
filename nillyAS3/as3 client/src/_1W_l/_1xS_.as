package _1W_l
{
   import flash.display.Sprite;
   import com.company.ui._0H_R_;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class _1xS_ extends Sprite
   {
       
      
      protected var _072:Vector.<String>;
      
      protected var w_:int;
      
      protected var h_:int;
      
      protected var labelText_:_0H_R_;
      
      protected var _hp:int = 0;
      
      protected var selected_:_1W_l._i;
      
      protected var _1pM_:Sprite;
      
      public function _1xS_(param1:Vector.<String>, param2:int, param3:int, param4:String = null)
      {
         this._1pM_ = new Sprite();
         super();
         this._072 = param1;
         this.w_ = param2;
         this.h_ = param3;
         if(param4 != null)
         {
            this.labelText_ = new _0H_R_(16,16777215,false,0,0);
            this.labelText_.setBold(true);
            this.labelText_.text = param4 + ":";
            this.labelText_.updateMetrics();
            addChild(this.labelText_);
            this._hp = this.labelText_.width + 5;
         }
         this._1J_d(0);
      }
      
      public function getValue() : String
      {
         return this.selected_.getValue();
      }
      
      public function setValue(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._072.length)
         {
            if(param1 == this._072[_loc2_])
            {
               this._1J_d(_loc2_);
               return;
            }
            _loc2_++;
         }
      }
      
      public function _1J_d(param1:int) : void
      {
         this.setSelected(this._072[param1]);
      }
      
      public function _0qK_() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._072.length)
         {
            if(this.selected_.getValue() == this._072[_loc1_])
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      private function setSelected(param1:String) : void
      {
         var _loc2_:String = null;
         _loc2_ = this.selected_ != null?this.selected_.getValue():null;
         this.selected_ = new _1W_l._i(param1,this.w_,this.h_);
         this.selected_.x = this._hp;
         this.selected_.y = 0;
         addChild(this.selected_);
         this.selected_.addEventListener(MouseEvent.CLICK,this._1k9);
         if(param1 != _loc2_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this.selected_.removeEventListener(MouseEvent.CLICK,this._1k9);
         if(contains(this.selected_))
         {
            removeChild(this.selected_);
         }
         this._V_c();
      }
      
      private function _V_c() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Point = null;
         var _loc3_:_1W_l._i = null;
         var _loc4_:int = 0;
         _loc1_ = 0;
         _loc2_ = parent.localToGlobal(new Point(x,y));
         this._1pM_.x = _loc2_.x;
         this._1pM_.y = _loc2_.y;
         while(_loc4_ < this._072.length)
         {
            _loc3_ = new _1W_l._i(this._072[_loc4_],this.w_,this.h_);
            _loc3_.addEventListener(MouseEvent.CLICK,this.onSelect);
            _loc3_.x = this._hp;
            _loc3_.y = _loc1_;
            this._1pM_.addChild(_loc3_);
            _loc1_ = _loc1_ + _loc3_.h_;
            _loc4_++;
         }
         this._1pM_.addEventListener(MouseEvent.ROLL_OUT,this._0A_4);
         stage.addChild(this._1pM_);
      }
      
      private function _J_O_() : void
      {
         this._1pM_.removeEventListener(MouseEvent.ROLL_OUT,this._0A_4);
         stage.removeChild(this._1pM_);
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this._J_O_();
         var _loc2_:_1W_l._i = param1.target as _1W_l._i;
         this.setSelected(_loc2_.getValue());
      }
      
      private function _0A_4(param1:MouseEvent) : void
      {
         this._J_O_();
         this.setSelected(this.selected_.getValue());
      }
   }
}
