package _W_Q_
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import flash.display.Shape;
   import com.company.assembleegameclient.ui.ScrollBar;
   import _0hJ_.Server;
   import _f7.Signal;
   import flash.events.Event;
   import com.company.googleanalytics.GA;
   import _ju._0G_n;
   import _05g._0D_3;
   import flash.display.Graphics;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import _ju._0O_M_;
   
   public class _S_2 extends Sprite
   {
       
      
      private var _1jv:SimpleText;
      
      private var _0X_1:Shape;
      
      private var _M_u:Sprite;
      
      private var _W_N_:_W_Q_._B_3;
      
      private var _0__6:ScrollBar;
      
      private var servers:Vector.<Server>;
      
      public var _0Q_d:Signal;
      
      public function _S_2()
      {
         super();
         addChild(new _0O_M_());
         this._0Q_d = new Signal();
         addChild(new _0O_M_());
         addChild(new TitleBasicAccountInfo());
      }
      
      private function _0f0(param1:Event) : void
      {
         this._W_N_.y = 8 - this._0__6._zH_() * (this._W_N_.height - 400);
      }
      
      public function initialize(param1:Vector.<Server>) : void
      {
         this.servers = param1;
         this._1E_5();
         this._0t2();
         this.makeContainer();
         this._vy();
         this._W_N_.height > 400 && this._0K_o();
         this._R_J_();
         GA.global().trackPageview("/serversScreen");
      }
      
      private function _R_J_() : void
      {
         var _loc1_:_0G_n = new _0G_n();
         var _loc2_:TextButton = _0D_3._7Q_();
         _loc1_._19d(_loc2_,_0G_n.CENTER);
         _loc2_.clicked.add(this._11L_);
         addChild(_loc1_);
      }
      
      private function _0K_o() : void
      {
         this._0__6 = new ScrollBar(16,400);
         this._0__6.x = 800 - this._0__6.width - 4;
         this._0__6.y = 104;
         this._0__6._0jj(400,this._W_N_.height);
         this._0__6.addEventListener(Event.CHANGE,this._0f0);
         addChild(this._0__6);
      }
      
      private function _vy() : void
      {
         this._W_N_ = new _W_Q_._B_3(this.servers);
         this._W_N_.y = 8;
         this._W_N_.addEventListener(Event.COMPLETE,this._11L_);
         this._M_u.addChild(this._W_N_);
      }
      
      private function makeContainer() : void
      {
         this._M_u = new Sprite();
         this._M_u.x = 4;
         this._M_u.y = 100;
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginFill(16777215);
         _loc1_.graphics.drawRect(0,0,776,430);
         _loc1_.graphics.endFill();
         this._M_u.addChild(_loc1_);
         this._M_u.mask = _loc1_;
         addChild(this._M_u);
      }
      
      private function _0t2() : void
      {
         this._0X_1 = new Shape();
         var _loc1_:Graphics = this._0X_1.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(2,5526612);
         _loc1_.moveTo(0,100);
         stage;
         _loc1_.lineTo(800,100);
         _loc1_.lineStyle();
         addChild(this._0X_1);
      }
      
      private function _1E_5() : void
      {
         this._1jv = new SimpleText().setSize(18).setColor(11776947).setBold(true);
         this._1jv.setStringBuilder(new _dU_().setParams(_1O_I_._1U_T_));
         this._1jv.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._1jv.x = 18;
         this._1jv.y = 72;
         addChild(this._1jv);
      }
      
      private function _11L_() : void
      {
         this._0Q_d.dispatch();
      }
   }
}
