package _05g
{
   import flash.display.Sprite;
   import flash.geom.Point;
   import _E_X_.MiniMap;
   import _1O_n._0E_l;
   import com.company.assembleegameclient.objects.Player;
   import _18._15m;
   import _0Z_1._1K_b;
   import com.company.assembleegameclient.ui._1uM_;
   import com.company.assembleegameclient.game.GameSprite;
   import flash.display.IGraphicsData;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import com.company.util.GraphicHelper;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import Packets.Server.TradeStart;
   import flash.events.Event;
   import Packets.Server.TradeChanged;
   import Packets.Server.TradeAccepted;
   import com.company.util._mL_;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class UserHud extends Sprite implements _02n
   {
       
      
      private const _0v8:Point = new Point(0,0);
      
      private const _bA_:Point = new Point(4,4);
      
      private const _1x__:Point = new Point(0,198);
      
      private const _0I_s:Point = new Point(12,230);
      
      private const _1T_D_:Point = new Point(14,304);
      
      private const _D_j:Point = new Point(7,346);
      
      private const _1F_W_:Point = new Point(0,500);
      
      private var background:_05g._2__C_;
      
      private var miniMap:MiniMap;
      
      private var _1gG_:_0E_l;
      
      private var _zG_:_05g._0F_q;
      
      private var _0Z_m:_05g.CharacterDetailsView;
      
      private var _R_3:Sprite;
      
      private var player:Player;
      
      public var _0Y_x:_15m;
      
      public var interactPanel:_1K_b;
      
      public var _082:_1uM_;
      
      public function UserHud()
      {
         super();
         this._0oE_();
         this._bt();
         this._1fU_();
      }
      
      private function _0oE_() : void
      {
         this.background = new _05g._2__C_();
         this.miniMap = new MiniMap(192,192);
         this._0Y_x = new _15m();
         this._0Z_m = new _05g.CharacterDetailsView();
         this._zG_ = new _05g._0F_q();
      }
      
      private function _bt() : void
      {
         addChild(this.background);
         addChild(this.miniMap);
         addChild(this._0Y_x);
         addChild(this._0Z_m);
         addChild(this._zG_);
      }
      
      private function _1fU_() : void
      {
         this.background.x = this._0v8.x;
         this.background.y = this._0v8.y;
         this.miniMap.x = this._bA_.x;
         this.miniMap.y = this._bA_.y;
         this._0Y_x.x = this._D_j.x;
         this._0Y_x.y = this._D_j.y;
         this._0Z_m.x = this._1x__.x;
         this._0Z_m.y = this._1x__.y;
         this._zG_.x = this._0I_s.x;
         this._zG_.y = this._0I_s.y;
      }
      
      public function _c3(param1:GameSprite) : void
      {
         this.player = param1.map.player_;
         this._X_G_();
         this._18e();
         this._W_t(param1);
      }
      
      private function _W_t(param1:GameSprite) : void
      {
         this.interactPanel = new _1K_b(param1,this.player,200,100);
         this.interactPanel.x = this._1F_W_.x;
         this.interactPanel.y = this._1F_W_.y;
         addChild(this.interactPanel);
      }
      
      private function _18e() : void
      {
         this._1gG_ = new _0E_l(this.player,this.player._01e,this.player);
         this._1gG_.x = this._1T_D_.x;
         this._1gG_.y = this._1T_D_.y;
         addChild(this._1gG_);
      }
      
      private function _X_G_() : void
      {
         var _loc1_:Vector.<IGraphicsData> = null;
         var _loc2_:GraphicsSolidFill = new GraphicsSolidFill(6776679,1);
         var _loc3_:GraphicsPath = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         _loc1_ = new <IGraphicsData>[_loc2_,_loc3_,GraphicHelper.END_FILL];
         GraphicHelper.drawUi(0,0,178,46,6,[1,1,1,1],_loc3_);
         this._R_3 = new Sprite();
         this._R_3.x = this._1T_D_.x - 3;
         this._R_3.y = this._1T_D_.y - 3;
         this._R_3.graphics.drawGraphicsData(_loc1_);
         addChild(this._R_3);
      }
      
      public function draw() : void
      {
         if(this._1gG_)
         {
            this._1gG_.draw();
         }
         if(this.interactPanel)
         {
            this.interactPanel.draw();
         }
      }
      
      public function startTrade(param1:GameSpriteBase, param2:TradeStart) : void
      {
         if(!this._082)
         {
            this._082 = new _1uM_(param1,param2);
            this._082.y = 200;
            this._082.addEventListener(Event.CANCEL,this._t8);
            addChild(this._082);
            this._1G_W_(false);
         }
      }
      
      private function _1G_W_(param1:Boolean) : void
      {
         this._0Z_m.visible = param1;
         this._zG_.visible = param1;
         this._0Y_x.visible = param1;
         this._1gG_.visible = param1;
         this._R_3.visible = param1;
         this.interactPanel.visible = param1;
      }
      
      public function tradeDone() : void
      {
         this._1ma();
      }
      
      public function tradeChanged(param1:TradeChanged) : void
      {
         if(this._082)
         {
            this._082._X_x(param1.offer_);
         }
      }
      
      public function tradeAccepted(param1:TradeAccepted) : void
      {
         if(this._082)
         {
            this._082._qX_(param1.myOffer_,param1.yourOffer_);
         }
      }
      
      private function _t8(param1:Event) : void
      {
         this._1ma();
      }
      
      private function _1ma() : void
      {
         if(this._082)
         {
            _mL_._0g1(this,this._082);
            this._082.removeEventListener(Event.CANCEL,this._t8);
            this._082 = null;
            this._1G_W_(true);
         }
      }
      
      public function setMiniMapFocus(param1:GameObject) : void
      {
         this.miniMap.setFocus(param1);
      }
   }
}
