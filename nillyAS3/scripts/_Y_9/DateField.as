package _Y_9
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import com.company.ui._0H_R_;
   import _09j._G_I_;
   import _1xa._dU_;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.text.TextFieldAutoSize;
   import flash.events.TextEvent;
   import flash.events.FocusEvent;
   import flash.events.Event;
   import _f7.Signal;
   import flash.filters.DropShadowFilter;
   import _C_._1O_I_;
   
   public class DateField extends Sprite
   {
      
      private static const _0p0:uint = 3355443;
      
      private static const _0G_N_:uint = 16549442;
      
      private static const _br:uint = 4539717;
      
      private static const _1nw:uint = 11776947;
      
      private static const _ky:String = "1234567890";
      
      private static const _9u:uint = 5592405;
       
      
      public var label:SimpleText;
      
      public var days:_0H_R_;
      
      public var _1J_p:_0H_R_;
      
      public var _1xZ_:_0H_R_;
      
      private var _1__4:SimpleText;
      
      private var _H_j:SimpleText;
      
      private var _0pB_:SimpleText;
      
      private var _3Q_:int;
      
      private var _3O_:_G_I_;
      
      public function DateField()
      {
         super();
         this._3O_ = new _G_I_();
         this._3Q_ = new Date().getFullYear();
         this.label = new SimpleText().setSize(18).setColor(11776947);
         this.label.setBold(true);
         this.label.setStringBuilder(new _dU_().setParams(name));
         this.label.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.label);
         this._1J_p = new _0H_R_(20,_1nw,true,35,30);
         this._1J_p.restrict = _ky;
         this._1J_p.maxChars = 2;
         this._1J_p.y = 30;
         this._1J_p.x = 6;
         this._1J_p.border = false;
         this._1J_p.updateMetrics();
         this._1J_p.addEventListener(TextEvent.TEXT_INPUT,this._U_Y_);
         this._1J_p.addEventListener(FocusEvent.FOCUS_OUT,this._0F_d);
         this._1J_p.addEventListener(Event.CHANGE,this._zy);
         this._H_j = this._0gn(this._1J_p,_1O_I_._1g5);
         addChild(this._H_j);
         addChild(this._1J_p);
         this.days = new _0H_R_(20,_1nw,true,35,30);
         this.days.restrict = _ky;
         this.days.maxChars = 2;
         this.days.y = 30;
         this.days.x = 63;
         this.days.border = false;
         this.days.updateMetrics();
         this.days.addEventListener(TextEvent.TEXT_INPUT,this._0dx);
         this.days.addEventListener(FocusEvent.FOCUS_OUT,this._get);
         this.days.addEventListener(Event.CHANGE,this._1Q_6);
         this._1__4 = this._0gn(this.days,_1O_I_._em);
         addChild(this._1__4);
         addChild(this.days);
         this._1xZ_ = new _0H_R_(20,_1nw,true,55,30);
         this._1xZ_.restrict = _ky;
         this._1xZ_.maxChars = 4;
         this._1xZ_.y = 30;
         this._1xZ_.x = 118;
         this._1xZ_.border = false;
         this._1xZ_.updateMetrics();
         this._1xZ_.restrict = _ky;
         this._1xZ_.addEventListener(TextEvent.TEXT_INPUT,this._0C_s);
         this._1xZ_.addEventListener(Event.CHANGE,this._07j);
         this._0pB_ = this._0gn(this._1xZ_,_1O_I_._rE_);
         addChild(this._0pB_);
         addChild(this._1xZ_);
         this._ur(false);
      }
      
      public function setTitle(param1:String) : void
      {
         this.label.setStringBuilder(new _dU_().setParams(param1));
      }
      
      public function _ur(param1:Boolean) : void
      {
         this._2w(this._1J_p,0,0,param1);
         this._2w(this.days,0,0,param1);
         this._2w(this._1xZ_,0,0,param1);
      }
      
      private function _2w(param1:_0H_R_, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc5_:uint = !!param4?uint(_0G_N_):uint(_br);
         graphics.lineStyle(2,_loc5_,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         graphics.beginFill(_0p0,1);
         graphics.drawRect(param1.x - param2 - 5,param1.y - param3,param1.width + param2 * 2,param1.height + param3 * 2);
         graphics.endFill();
         graphics.lineStyle();
      }
      
      private function _0gn(param1:_0H_R_, param2:String) : SimpleText
      {
         var _loc3_:SimpleText = null;
         _loc3_ = new SimpleText().setSize(16).setColor(_9u);
         _loc3_.setTextWidth(param1.width + 4).setTextHeight(param1.height);
         _loc3_.x = param1.x - 6;
         _loc3_.y = param1.y + 3;
         _loc3_.setStringBuilder(new _dU_().setParams(param2));
         _loc3_.setAutoSize(TextFieldAutoSize.CENTER);
         return _loc3_;
      }
      
      private function _U_Y_(param1:TextEvent) : void
      {
         var _loc2_:String = this._1J_p.text + param1.text;
         var _loc3_:int = int(_loc2_);
         if(_loc2_ != "0" && !this._3O_._X_2(_loc3_))
         {
            param1.preventDefault();
         }
      }
      
      private function _0F_d(param1:FocusEvent) : void
      {
         var _loc2_:int = int(this._1J_p.text);
         if(_loc2_ < 10 && this.days.text != "")
         {
            this._1J_p.text = "0" + _loc2_.toString();
         }
      }
      
      private function _zy(param1:Event) : void
      {
         this._H_j.visible = !this._1J_p.text;
      }
      
      private function _0dx(param1:TextEvent) : void
      {
         var _loc2_:String = this.days.text + param1.text;
         var _loc3_:int = int(_loc2_);
         if(_loc2_ != "0" && !this._3O_._J_k(_loc3_))
         {
            param1.preventDefault();
         }
      }
      
      private function _get(param1:FocusEvent) : void
      {
         var _loc2_:int = int(this.days.text);
         if(_loc2_ < 10 && this.days.text != "")
         {
            this.days.text = "0" + _loc2_.toString();
         }
      }
      
      private function _1Q_6(param1:Event) : void
      {
         this._1__4.visible = !this.days.text;
      }
      
      private function _0C_s(param1:TextEvent) : void
      {
         var _loc2_:String = this._1xZ_.text + param1.text;
         var _loc3_:int = this._0tN_(_loc2_);
         if(_loc3_ > this._3Q_)
         {
            param1.preventDefault();
         }
      }
      
      private function _0tN_(param1:String) : int
      {
         while(param1.length < 4)
         {
            param1 = param1 + "0";
         }
         return int(param1);
      }
      
      private function _07j(param1:Event) : void
      {
         this._0pB_.visible = !this._1xZ_.text;
      }
      
      public function _1L_A_() : Boolean
      {
         var _loc1_:int = int(this._1J_p.text);
         var _loc2_:int = int(this.days.text);
         var _loc3_:int = int(this._1xZ_.text);
         return this._3O_._1L_A_(_loc1_,_loc2_,_loc3_,100);
      }
      
      public function _K___() : String
      {
         var _loc1_:String = this._dO_(this._1J_p.text,2);
         var _loc2_:String = this._dO_(this.days.text,2);
         var _loc3_:String = this._dO_(this._1xZ_.text,4);
         return _loc1_ + "/" + _loc2_ + "/" + _loc3_;
      }
      
      private function _dO_(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      public function _1pv() : Signal
      {
         return this.label.textChanged;
      }
   }
}
