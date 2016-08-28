package _W_Q_
{
   import flash.display.Sprite;
   import _1R_o._Y_5;
   import ToolTips._0bd;
   import _1R_o._0xf;
   import _1gF_.SimpleText;
   import flash.display.DisplayObject;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import flash.events.Event;
   import flash.utils.getTimer;
   import flash.events.MouseEvent;
   import _1xa.SText;
   import _1xa._1eo;
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class _0G_K_ extends Sprite implements _Y_5
   {
      
      public static var _I_q:_0bd = new _0bd(3552822,10197915,null,"",150);
       
      
      public var _18D_:_0xf;
      
      public var description:String;
      
      public var level:int;
      
      public var _0dQ_:int;
      
      public var _T_t:String;
      
      public var _0U_c:String;
      
      private var startTime_:int = 0;
      
      private var nameText_:SimpleText;
      
      private var _1oS_:SimpleText;
      
      private var _zf:DisplayObject;
      
      public function _0G_K_(param1:int, param2:uint, param3:uint, param4:String, param5:String, param6:int, param7:int, param8:String, param9:String, param10:DisplayObject)
      {
         this._18D_ = new _0xf();
         super();
         this.name = param4;
         this.description = param5;
         this.level = param6;
         this._0dQ_ = param7;
         this._T_t = param8;
         this._0U_c = param9;
         this.nameText_ = new SimpleText().setSize(param1).setColor(param2);
         this.nameText_.setBold(true);
         this.nameText_.setAutoSize(TextFieldAutoSize.RIGHT);
         this.nameText_.setStringBuilder(new _dU_().setParams(param4));
         this.nameText_.x = 410;
         this.nameText_.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         addChild(this.nameText_);
         if(this._0dQ_ != -1)
         {
            this._1oS_ = new SimpleText().setSize(param1).setColor(param3);
            this._1oS_.setBold(true);
            this._1oS_.setStringBuilder(new SText(param8 + "0" + " " + param9));
            this._1oS_.x = 450;
            this._1oS_.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
            addChild(this._1oS_);
         }
         if(param10 != null)
         {
            this._zf = param10;
            this.nameText_.textChanged.addOnce(this.onTextChanged);
            addChild(this._zf);
         }
         this._18D_._bD_(this);
         if(param5)
         {
            this._18D_.tooltip = _I_q;
         }
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onTextChanged() : void
      {
         if(this._1oS_ != null)
         {
            this._zf.x = this._1oS_.x + this._1oS_.width - 4;
            this._zf.y = this._1oS_.height / 2 - this._zf.height / 2 + 2;
         }
         else
         {
            this._zf.x = 450;
            this._zf.y = this.nameText_.height / 2 - this._zf.height / 2 + 2;
         }
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._18D_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._18D_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._18D_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._18D_._fn();
      }
      
      public function _0D_8() : void
      {
         this.startTime_ = -1000000;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         if(this.startTime_ == 0)
         {
            this.startTime_ = getTimer();
         }
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
      }
      
      public function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = Math.min(1,(getTimer() - this.startTime_) / 500);
         if(this._1oS_ != null)
         {
            _loc2_ = this._0dQ_ * _loc3_;
            this._1oS_.setStringBuilder(new SText(this._T_t + _loc2_.toString() + " " + this._0U_c));
            if(this._zf != null)
            {
               this._zf.x = this._1oS_.x + this._1oS_.width - 4;
               this._zf.y = this._1oS_.height / 2 - this._zf.height / 2 + 2;
            }
         }
         if(_loc3_ == 1)
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      public function onMouseOver(param1:Event) : void
      {
         if(this.description != null)
         {
            _I_q._0D_S_(this._1es());
            stage.addChild(_I_q);
         }
      }
      
      private function _1es() : _1eo
      {
         var _loc1_:AppendingLineBuilder = new AppendingLineBuilder();
         _loc1_.setDelimiter("");
         _loc1_.pushParams(this.description);
         if(this.level > 1)
         {
            _loc1_.pushParams(_1O_I_._1N_q,{"data":" ("});
            _loc1_.pushParams("FameBonus.LevelRequirement",{"level":this.level});
            _loc1_.pushParams(_1O_I_._1N_q,{"data":")"});
         }
         return _loc1_;
      }
   }
}
