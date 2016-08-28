package _tZ_
{
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import com.company.util.MoreColorUtil;
   import com.company.assembleegameclient.util.GuildUtil;
   import _1O_R_.Dialog;
   import _C_._1O_I_;
   import _1xa._dU_;
   import _0H_6.GameContext;
   import _3b.DialogSignal;
   import flash.events.Event;
   import _3b.CloseDialogsSignal;
   import _1xa.SText;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import com.company.rotmg.graphics.DeleteXGraphic;
   
   class _0sO_ extends Sprite
   {
      
      public static const WIDTH:int = 756;
      
      public static const HEIGHT:int = 32;
      
      protected static const _nz:ColorTransform = new ColorTransform(1,220 / 255,133 / 255);
       
      
      private var name_:String;
      
      private var _1xi:int;
      
      private var _0cx:SimpleText;
      
      private var nameText_:SimpleText;
      
      private var daysPast_:SimpleText;
      
      private var _19P_:SimpleText;
      
      private var _1P___:Bitmap;
      
      private var _0j5:Bitmap;
      
      private var _1__f:SimpleText;
      
      private var _1D_I_:Sprite;
      
      private var _1V_R_:Sprite;
      
      private var _1mi:Sprite;
      
      function _0sO_(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:int, param7:int)
      {
         var _loc8_:uint = 0;
         super();
         this.name_ = param2;
         this._1xi = param3;
         _loc8_ = 11776947;
         if(param5)
         {
            _loc8_ = 16564761;
         }
         this._0cx = new SimpleText().setSize(22).setColor(_loc8_);
         this._0cx.setStringBuilder(new SText(param1.toString() + "."));
         this._0cx.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._0cx.x = 60 - this._0cx.width;
         this._0cx.y = 4;
         addChild(this._0cx);
         this.nameText_ = new SimpleText().setSize(22).setColor(_loc8_);
         this.nameText_.setStringBuilder(new SText(param2));
         this.nameText_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.nameText_.x = 100;
         this.nameText_.y = 4;
         addChild(this.nameText_);
         this.daysPast_ = new SimpleText().setSize(22).setColor(_loc8_);
         var _loc9_:String = this.getLastSeenDiff(param7);
         this.daysPast_.setStringBuilder(new SText(_loc9_));
         this.daysPast_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.daysPast_.x = 250;
         this.daysPast_.y = 4;
         addChild(this.daysPast_);
         this._19P_ = new SimpleText().setSize(22).setColor(_loc8_);
         this._19P_.setAutoSize(TextFieldAutoSize.RIGHT);
         this._19P_.setStringBuilder(new SText(param4.toString()));
         this._19P_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._19P_.x = 508;
         this._19P_.y = 4;
         addChild(this._19P_);
         this._1P___ = new Bitmap(GuildUtil._0ge(40));
         this._1P___.x = 500;
         this._1P___.y = HEIGHT / 2 - this._1P___.height / 2;
         addChild(this._1P___);
         this._0j5 = new Bitmap(GuildUtil._0mx(param3,20));
         this._0j5.x = 548;
         this._0j5.y = HEIGHT / 2 - this._0j5.height / 2;
         addChild(this._0j5);
         this._1__f = new SimpleText().setSize(22).setColor(_loc8_);
         this._1__f.setStringBuilder(new _dU_().setParams(GuildUtil._oB_(param3)));
         this._1__f.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._1__f.setVerticalAlign(SimpleText.MIDDLE);
         this._1__f.x = 580;
         this._1__f.y = HEIGHT / 2;
         addChild(this._1__f);
         if(GuildUtil._O_0(param6,param3))
         {
            this._1D_I_ = this._0B_O_(true);
            this._0O_H_(this._1D_I_);
            this._1D_I_.addEventListener(MouseEvent.CLICK,this._1eK_);
            this._1D_I_.x = 670 + 6;
            this._1D_I_.y = HEIGHT / 2;
            addChild(this._1D_I_);
         }
         if(GuildUtil._0V_B_(param6,param3))
         {
            this._1V_R_ = this._0B_O_(false);
            this._0O_H_(this._1V_R_);
            this._1V_R_.addEventListener(MouseEvent.CLICK,this._1E_Y_);
            this._1V_R_.x = 700 + 6;
            this._1V_R_.y = HEIGHT / 2;
            addChild(this._1V_R_);
         }
         if(GuildUtil._14__(param6,param3))
         {
            this._1mi = new DeleteXGraphic();
            this._0O_H_(this._1mi);
            this._1mi.addEventListener(MouseEvent.CLICK,this._0R_x);
            this._1mi.x = 730;
            this._1mi.y = HEIGHT / 2 - this._1mi.height / 2;
            addChild(this._1mi);
         }
      }
      
      private function _0B_O_(param1:Boolean) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:Graphics = _loc2_.graphics;
         _loc3_.beginFill(16777215);
         _loc3_.moveTo(-8,-6);
         _loc3_.lineTo(8,-6);
         _loc3_.lineTo(0,6);
         _loc3_.lineTo(-8,-6);
         if(param1)
         {
            _loc2_.rotation = 180;
         }
         return _loc2_;
      }
      
      private function getLastSeenDiff(param1:Number) : String
      {
         var _loc2_:Number = new Date().time / 1000;
         var _loc3_:Number = _loc2_ - param1;
         var _loc4_:int = _loc3_ / 60;
         var _loc5_:int = _loc4_ / 60;
         var _loc6_:int = _loc5_ / 24;
         if(_loc3_ >= _loc2_)
         {
            return "???";
         }
         if(_loc6_ <= 0)
         {
            if(_loc5_ <= 0)
            {
               if(_loc4_ <= 0)
               {
                  return "<1 minute";
               }
               return _loc4_ + " minute" + (_loc4_ > 1?"s":"");
            }
            return _loc5_ + " hour" + (_loc5_ > 1?"s":"");
         }
         return _loc6_ + " day" + (_loc6_ > 1?"s":"");
      }
      
      private function _0O_H_(param1:Sprite) : void
      {
         param1.addEventListener(MouseEvent.MOUSE_OVER,this._1aZ_);
         param1.addEventListener(MouseEvent.ROLL_OUT,this._1zj);
      }
      
      private function _1aZ_(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.currentTarget as Sprite;
         _loc2_.transform.colorTransform = _nz;
      }
      
      private function _1zj(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.currentTarget as Sprite;
         _loc2_.transform.colorTransform = MoreColorUtil.identity;
      }
      
      private function _1eK_(param1:MouseEvent) : void
      {
         var _loc2_:String = GuildUtil._oB_(GuildUtil._1L_Q_(this._1xi));
         var _loc3_:Dialog = new Dialog("","",_1O_I_._G_B_,_1O_I_._T_d,"/promote");
         _loc3_._1aO_(_1O_I_._iG_,{
            "name":this.name_,
            "rank":_loc2_
         });
         _loc3_._1Z_F_(new _dU_().setParams(_1O_I_._17v,{"name":this.name_}));
         _loc3_.addEventListener(Dialog.LEFT_BUTTON,this._0bX_);
         _loc3_.addEventListener(Dialog.RIGHT_BUTTON,this._0G_8);
         GameContext.getInjector().getInstance(DialogSignal).dispatch(_loc3_);
      }
      
      private function _0G_8(param1:Event) : void
      {
         dispatchEvent(new _1V_7(_1V_7.SET_RANK,this.name_,GuildUtil._1L_Q_(this._1xi)));
         GameContext.getInjector().getInstance(CloseDialogsSignal).dispatch();
      }
      
      private function _1E_Y_(param1:MouseEvent) : void
      {
         var _loc2_:String = GuildUtil._oB_(GuildUtil._1ff(this._1xi));
         var _loc3_:Dialog = new Dialog("","",_1O_I_._0P_U_,_1O_I_._X_N_,"/demote");
         _loc3_._1aO_(_1O_I_._0__N_,{
            "name":this.name_,
            "rank":_loc2_
         });
         _loc3_._1Z_F_(new _dU_().setParams(_1O_I_._1jL_,{"name":this.name_}));
         _loc3_.addEventListener(Dialog.LEFT_BUTTON,this._0bX_);
         _loc3_.addEventListener(Dialog.RIGHT_BUTTON,this._0uJ_);
         GameContext.getInjector().getInstance(DialogSignal).dispatch(_loc3_);
      }
      
      private function _0uJ_(param1:Event) : void
      {
         dispatchEvent(new _1V_7(_1V_7.SET_RANK,this.name_,GuildUtil._1ff(this._1xi)));
         GameContext.getInjector().getInstance(CloseDialogsSignal).dispatch();
      }
      
      private function _0R_x(param1:MouseEvent) : void
      {
         var _loc2_:Dialog = new Dialog("","",_1O_I_._0P_h,_1O_I_._8B_,"/removeFromGuild");
         _loc2_._1aO_(_1O_I_._02F_,{"name":this.name_});
         _loc2_._1Z_F_(new _dU_().setParams(_1O_I_._0aX_,{"name":this.name_}));
         _loc2_.addEventListener(Dialog.LEFT_BUTTON,this._0bX_);
         _loc2_.addEventListener(Dialog.RIGHT_BUTTON,this._0qk);
         GameContext.getInjector().getInstance(DialogSignal).dispatch(_loc2_);
      }
      
      private function _0qk(param1:Event) : void
      {
         GameContext.getInjector().getInstance(CloseDialogsSignal).dispatch();
         dispatchEvent(new _1V_7(_1V_7.REMOVE_MEMBER,this.name_));
      }
      
      private function _0bX_(param1:Event) : void
      {
         GameContext.getInjector().getInstance(CloseDialogsSignal).dispatch();
      }
   }
}
