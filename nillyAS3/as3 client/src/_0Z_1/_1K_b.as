package _0Z_1
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.objects._1kF_;
   import flash.events.Event;
   import _1O_n._zL_;
   
   public class _1K_b extends Sprite
   {
      
      public static const _0I_w:Number = 1;
       
      
      public var gs_:GameSprite;
      
      public var player_:Player;
      
      public var w_:int;
      
      public var h_:int;
      
      public var _wd:_0Z_1.Panel = null;
      
      public var _1bh:_1kF_ = null;
      
      public var _1W_O_:_0Z_1._1D_S_;
      
      private var _V_s:_0Z_1.Panel;
      
      public var _G_0:Function;
      
      public function _1K_b(param1:GameSprite, param2:Player, param3:int, param4:int)
      {
         super();
         this.gs_ = param1;
         this.player_ = param2;
         this.w_ = param3;
         this.h_ = param4;
         this._1W_O_ = new _0Z_1._1D_S_(param1);
      }
      
      public function setOverride(param1:_0Z_1.Panel) : void
      {
         if(this._V_s != null)
         {
            this._V_s.removeEventListener(Event.COMPLETE,this.onComplete);
         }
         this._V_s = param1;
         this._V_s.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      public function redraw() : void
      {
         this._wd.draw();
      }
      
      public function draw() : void
      {
         var _loc1_:_1kF_ = null;
         var _loc2_:_0Z_1.Panel = null;
         if(this._V_s != null)
         {
            this._1C_(this._V_s);
            this._wd.draw();
            return;
         }
         _loc1_ = this._G_0();
         if(this._wd == null || _loc1_ != this._1bh)
         {
            this._1bh = _loc1_;
            if(this._1bh != null)
            {
               _loc2_ = this._1bh.getPanel(this.gs_);
               this._1W_O_ = new _0Z_1._1D_S_(this.gs_);
            }
            else
            {
               _loc2_ = this._1W_O_;
            }
            this._1C_(_loc2_);
         }
         if(this._wd)
         {
            this._wd.draw();
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         if(this._V_s != null)
         {
            this._V_s.removeEventListener(Event.COMPLETE,this.onComplete);
            this._V_s = null;
         }
         this._1C_(null);
         this.draw();
      }
      
      public function _1C_(param1:_0Z_1.Panel) : void
      {
         if(param1 != this._wd)
         {
            this._wd && removeChild(this._wd);
            this._wd = param1;
            this._wd && this._1N_b();
         }
      }
      
      private function _1N_b() : void
      {
         if(this._wd is _zL_)
         {
            this._wd.x = (this.w_ - this._wd.width) * 0.5;
            this._wd.y = 8;
         }
         else
         {
            this._wd.x = 6;
            this._wd.y = 8;
         }
         addChild(this._wd);
      }
   }
}
