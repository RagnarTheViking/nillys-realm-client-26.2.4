package _0mJ_
{
   import flash.display.Sprite;
   import flash.display.DisplayObjectContainer;
   import _1gF_.SimpleText;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import kabam.rotmg.assets.model.Animation;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _05g.TitleView;
   import _0H_6.GameContext;
   import _3b.DialogSignal;
   import _0J_8._0rs;
   import _0T_b._0E___;
   import _0T_b._mb;
   import _T_J_.GTween;
   import flash.events.Event;
   
   public class _0A_P_ extends Sprite
   {
      
      public static const _14J_:int = 5;
      
      public static const _0wi:Number = 0.58;
       
      
      private var screen:DisplayObjectContainer;
      
      private var _0nO_:SimpleText;
      
      private var _8__:Vector.<DisplayObject>;
      
      private var _1hX_:MovieClip;
      
      private var _02Z_:String;
      
      private var _s5:int;
      
      private var _12i:Animation;
      
      public function _0A_P_()
      {
         super();
         this._0N_c();
         this._0I_S_();
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function _0N_c() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(0);
         _loc1_.graphics.drawRect(0,0,800,600);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
      }
      
      private function _0I_S_() : void
      {
         var _loc1_:MovieClip = null;
         this.screen = new MapLoadingScreen();
         _loc1_ = this.screen.getChildByName("mapNameContainer") as MovieClip;
         this._0nO_ = new SimpleText().setSize(30).setColor(16777215);
         this._0nO_.setBold(true);
         this._0nO_.setAutoSize(TextFieldAutoSize.CENTER);
         this._0nO_.x = _loc1_.x;
         this._0nO_.y = _loc1_.y;
         this.screen.addChild(this._0nO_);
         this._1hX_ = this.screen.getChildByName("difficulty_indicators") as MovieClip;
         this._8__ = new Vector.<DisplayObject>(_14J_);
         var _loc2_:int = 1;
         while(_loc2_ <= _14J_)
         {
            this._8__[_loc2_ - 1] = this._1hX_.getChildByName("indicator_" + _loc2_);
            _loc2_++;
         }
         addChild(this.screen);
         this._97();
      }
      
      public function _1io(param1:String, param2:int) : void
      {
         this._02Z_ = !!param1?param1:"";
         this._s5 = param2;
         this._97();
      }
      
      private function _97() : void
      {
         var _loc1_:int = 0;
         if(this.screen)
         {
            this._0nO_.setStringBuilder(new _dU_().setParams(this._02Z_));
            if(this._s5 <= 0)
            {
               this.screen.getChildByName("bgGroup").visible = false;
               this._1hX_.visible = false;
            }
            else
            {
               this.screen.getChildByName("bgGroup").visible = true;
               this._1hX_.visible = true;
               _loc1_ = 0;
               while(_loc1_ < _14J_)
               {
                  this._8__[_loc1_].visible = _loc1_ < this._s5;
                  _loc1_++;
               }
            }
         }
      }
      
      public function _15a(param1:Animation) : void
      {
         this._12i = param1;
         addChild(param1);
         param1.start();
         param1.x = 399.5 - param1.width * 0.5 + 5;
         param1.y = 245.85 - param1.height * 0.5;
      }
      
      public function disable() : void
      {
         this._13d();
      }
      
      public function _1C_m() : void
      {
         parent && parent.removeChild(this);
      }
      
      private function _13d() : void
      {
         if(TitleView._03E_)
         {
            GameContext.getInjector().getInstance(DialogSignal).dispatch(new _0rs());
            TitleView._03E_ = false;
         }
         else if(TitleView._16I_)
         {
            GameContext.getInjector().getInstance(DialogSignal).dispatch(new _0E___());
            TitleView._16I_ = false;
         }
         else if(TitleView._9G_)
         {
            GameContext.getInjector().getInstance(DialogSignal).dispatch(new _0E___(true));
            TitleView._9G_ = false;
         }
         else if(TitleView._0kb)
         {
            GameContext.getInjector().getInstance(DialogSignal).dispatch(new _mb());
            TitleView._0kb = false;
         }
         var _loc1_:GTween = new GTween(this,_0wi,{"alpha":0});
         _loc1_.onComplete = this._0__M_;
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      private function _0__M_(param1:GTween) : void
      {
         parent && parent.removeChild(this);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this._12i.dispose();
      }
   }
}
