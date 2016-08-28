package ToolTips
{
   import kabam.rotmg.assets.services._0pW_;
   import _0E_T_._1zi;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.ui._1vJ_;
   import com.company.assembleegameclient.ui.StatusBar;
   import com.company.assembleegameclient.ui._0fL_;
   import _1gF_.SimpleText;
   import _1O_n._0E_l;
   import _1O_n._1S_u;
   import com.company.assembleegameclient.appengine._0Z_6;
   import _0H_6.GameContext;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _v4.Client;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import _C_._1O_I_;
   import _1pm._1Y_F_;
   import com.company.assembleegameclient.util.Star;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class MyPlayerToolTip extends ToolTip
   {
       
      
      private var factory:_0pW_;
      
      private var classes:_1zi;
      
      public var player_:Player;
      
      private var _R_G_:_1vJ_;
      
      private var _Q_m:StatusBar;
      
      private var _0P_p:StatusBar;
      
      private var _1__B_:_0fL_;
      
      private var bestLevel_:SimpleText;
      
      private var nextClassQuest_:SimpleText;
      
      private var _18H_:_0E_l;
      
      private var _0S_p:_1S_u;
      
      private var _1sE_:String;
      
      private var _zq:XML;
      
      private var charStats:_0Z_6;
      
      public function MyPlayerToolTip(param1:String, param2:XML, param3:_0Z_6)
      {
         super(3552822,1,16777215,1);
         this._1sE_ = param1;
         this._zq = param2;
         this.charStats = param3;
      }
      
      public function _5R_() : void
      {
         this.factory = GameContext.getInjector().getInstance(_0pW_);
         this.classes = GameContext.getInjector().getInstance(_1zi);
         var _loc1_:int = int(this._zq.ObjectType);
         var _loc2_:XML = ObjectLibrary.XmlData[_loc1_];
         this.player_ = Player._3o(this._1sE_,this._zq);
         this.player_.accountId_ = GameContext.getInjector().getInstance(Client).charList.accountId_;
         var _loc3_:_0ih = this.classes._0B_M_(this.player_.objectType_);
         var _loc4_:_Y_F_ = _loc3_._E_G_._nV_(this._zq.Texture);
         this.player_._1vr = this.factory._0wx(_loc4_._0C_3);
         this._R_G_ = new _1vJ_(11776947,true,this.player_,true);
         addChild(this._R_G_);
         this._Q_m = new StatusBar(176,16,14693428,5526612,_1O_I_._0t9);
         this._Q_m.x = 6;
         this._Q_m.y = 40;
         addChild(this._Q_m);
         this._0P_p = new StatusBar(176,16,6325472,5526612,_1O_I_._F_u);
         this._0P_p.x = 6;
         this._0P_p.y = 64;
         addChild(this._0P_p);
         this._18H_ = new _0E_l(null,this.player_._01e,this.player_);
         this._18H_.x = 8;
         this._18H_.y = 88;
         addChild(this._18H_);
         this._18H_.setItems(this.player_.inventory_);
         this._0S_p = new _1S_u(null,this.player_,_1Y_F_._J_p);
         this._0S_p.x = 8;
         this._0S_p.y = 132;
         addChild(this._0S_p);
         this._0S_p.setItems(this.player_.inventory_);
         this._1__B_ = new _0fL_(100,1842204);
         this._1__B_.x = 6;
         this._1__B_.y = 228;
         addChild(this._1__B_);
         this._K_P_();
         this.bestLevel_.x = 8;
         this.bestLevel_.y = height - 2;
         var _loc5_:int = Star.nextStarFame(this.charStats == null?0:int(this.charStats._1hK_()),0);
         if(_loc5_ > 0)
         {
            this._0S_A_(_loc5_,_loc2_);
         }
      }
      
      public function _0S_A_(param1:int, param2:XML) : void
      {
         this.nextClassQuest_ = new SimpleText().setSize(13).setColor(16549442).setTextWidth(174);
         this.nextClassQuest_.setStringBuilder(new _dU_().setParams(_1O_I_._0N_4,{
            "nextStarFame":param1,
            "character":param2.DisplayId
         }));
         this.nextClassQuest_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.nextClassQuest_);
         _01T_.push(this.nextClassQuest_.textChanged);
      }
      
      public function _K_P_() : void
      {
         this.bestLevel_ = new SimpleText().setSize(14).setColor(6206769);
         var _loc1_:int = this.charStats == null?0:int(this.charStats.numStars());
         var _loc2_:String = (this.charStats != null?this.charStats.bestLevel():0).toString();
         var _loc3_:String = (this.charStats != null?this.charStats._1hK_():0).toString();
         this.bestLevel_.setStringBuilder(new _dU_().setParams(_1O_I_._1jY_,{
            "numStars":_loc1_,
            "bestLevel":_loc2_,
            "fame":_loc3_
         }));
         this.bestLevel_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.bestLevel_);
         _01T_.push(this.bestLevel_.textChanged);
      }
      
      override protected function alignUI() : void
      {
         if(this.nextClassQuest_)
         {
            this.nextClassQuest_.x = 8;
            this.nextClassQuest_.y = this.bestLevel_.getBounds(this).bottom - 2;
         }
      }
      
      override public function draw() : void
      {
         this._Q_m.draw(this.player_.hp_,this.player_.maxHp_,this.player_.hpBonus_,this.player_._1S_q);
         this._0P_p.draw(this.player_.mp_,this.player_.maxMp_,this.player_.mpBonus_,this.player_._z2);
         this._1__B_._0Z_i(width - 10,1842204);
         super.draw();
      }
   }
}
