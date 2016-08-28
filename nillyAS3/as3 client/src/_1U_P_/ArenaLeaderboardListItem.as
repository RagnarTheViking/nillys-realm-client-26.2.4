package _1U_P_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.display.Bitmap;
   import _1cm._0uw;
   import _17B_._18A_;
   import _17B_._0o;
   import _1gF_._I_a;
   import _1xa.SText;
   import _1xa._dU_;
   import flash.events.MouseEvent;
   import _04h._083;
   import _C_._1O_I_;
   import _1F_z._1Z_D_;
   import flash.filters.DropShadowFilter;
   import _0H_6.GameContext;
   import flash.text.TextFieldAutoSize;
   
   public class ArenaLeaderboardListItem extends Sprite
   {
      
      private static const HEIGHT:int = 60;
       
      
      public const _Z_v:Signal = new Signal(Sprite);
      
      public const hideTooltip:Signal = new Signal();
      
      private var _1R_d:Sprite;
      
      private var _1ss:Sprite;
      
      private var _0B_u:Bitmap;
      
      private var _0G_x:_0uw;
      
      private var _0P_f:_18A_;
      
      private var rank:int = 0;
      
      private var _07P_:Bitmap;
      
      private var _K_p:Sprite;
      
      private var _3q:_0o;
      
      private var _0L_j:_I_a;
      
      private var playerName:_I_a;
      
      private var waveNumber:_I_a;
      
      private var _0C_r:_I_a;
      
      private var background:Sprite;
      
      private var _02K_:Boolean = false;
      
      private var _0I_p:Boolean = false;
      
      private var _1yp:SText;
      
      private var _0G_B_:SText;
      
      private var _w7:_dU_;
      
      private var _03Y_:SText;
      
      public function ArenaLeaderboardListItem()
      {
         this._1R_d = new Sprite();
         this._1ss = new Sprite();
         this._0B_u = new Bitmap();
         this._K_p = this._0r1();
         this._0L_j = this._1J_8();
         this.playerName = this._1J_8();
         this.waveNumber = this._1J_8();
         this._0C_r = this._1J_8();
         this.background = this._1L_c();
         this._1yp = new SText();
         this._0G_B_ = new SText();
         this._w7 = new _dU_();
         this._03Y_ = new SText();
         super();
         this._3q = GameContext.getInjector().getInstance(_0o);
         this._0L_j.setAutoSize(TextFieldAutoSize.RIGHT);
         this._0sF_();
         this.addEventListeners();
      }
      
      private function addEventListeners() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this._1R_d.addEventListener(MouseEvent.MOUSE_OVER,this._0N_2);
         this._1R_d.addEventListener(MouseEvent.MOUSE_OUT,this._V_q);
         this._1ss.addEventListener(MouseEvent.MOUSE_OVER,this._vW_);
         this._1ss.addEventListener(MouseEvent.MOUSE_OUT,this._v2);
      }
      
      private function _0sF_() : void
      {
         addChild(this.background);
         addChild(this._1R_d);
         addChild(this._K_p);
         addChild(this._1ss);
         addChild(this._0L_j);
         addChild(this.playerName);
         addChild(this.waveNumber);
         addChild(this._0C_r);
         this._1R_d.addChild(this._0B_u);
      }
      
      private function _V_q(param1:MouseEvent) : void
      {
         this.hideTooltip.dispatch();
      }
      
      private function _0N_2(param1:MouseEvent) : void
      {
         if(this._0G_x)
         {
            this._Z_v.dispatch(this._0G_x);
         }
      }
      
      private function _v2(param1:MouseEvent) : void
      {
         this.hideTooltip.dispatch();
      }
      
      private function _vW_(param1:MouseEvent) : void
      {
         if(this._0G_x)
         {
            this._Z_v.dispatch(this._0P_f);
         }
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         if(this._02K_)
         {
            this.background.alpha = 0;
         }
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         if(this._02K_)
         {
            this.background.alpha = 1;
         }
      }
      
      public function apply(param1:_083, param2:Boolean) : void
      {
         this._02K_ = param1 != null;
         if(param1)
         {
            this._1Q_S_(param1);
            this._1D_z(param1);
            if(param1.rank && param2)
            {
               this._0L_j.visible = true;
               this._0L_j.setStringBuilder(this._1yp.setString(param1.rank + "."));
            }
            else
            {
               this._0L_j.visible = false;
            }
            if(this._07P_)
            {
               this._0w4();
            }
            if(param1.pet)
            {
               this._1S_4(param1);
            }
            this.rank = param1.rank;
            this._0I_p = param1._0I_p;
            this.setColor();
         }
         else
         {
            this.clear();
         }
         this.align();
      }
      
      private function _1D_z(param1:_083) : void
      {
         this.waveNumber.setStringBuilder(this._w7.setParams(_1O_I_._0ks,{"waveNumber":(param1.arenaWave - 1).toString()}));
         this._0C_r.setStringBuilder(this._03Y_.setString(this._1gg(Math.floor(param1.arenaTime))));
      }
      
      private function _1Q_S_(param1:_083) : void
      {
         this._0B_u.bitmapData = param1._each;
         this._0G_x = new _0uw(param1);
         this.playerName.setStringBuilder(this._0G_B_.setString(param1.name));
      }
      
      private function _1S_4(param1:_083) : void
      {
         this._0P_f = new _18A_(param1.pet);
         this._07P_ = this._1md(param1.pet,48);
         this._1ss.addChild(this._07P_);
         this._K_p.visible = true;
      }
      
      private function _0w4() : void
      {
         this._1ss.removeChild(this._07P_);
         this._0P_f = null;
         this._07P_ = null;
         this._K_p.visible = false;
      }
      
      private function _1md(param1:_1Z_D_, param2:int) : Bitmap
      {
         return new Bitmap(this._3q._0nY_(param1,param2));
      }
      
      public function setColor() : void
      {
         var _loc1_:uint = 16777215;
         if(this._0I_p)
         {
            _loc1_ = 16567065;
         }
         else if(this.rank == 1)
         {
            _loc1_ = 16777103;
         }
         this.playerName.setColor(_loc1_);
         this.waveNumber.setColor(_loc1_);
         this._0C_r.setColor(_loc1_);
         this._0L_j.setColor(_loc1_);
      }
      
      public function clear() : void
      {
         this._0B_u.bitmapData = null;
         this.playerName.setStringBuilder(this._0G_B_.setString(""));
         this.waveNumber.setStringBuilder(this._w7.setParams(""));
         this._0C_r.setStringBuilder(this._03Y_.setString(""));
         this._0L_j.setStringBuilder(this._1yp.setString(""));
         if(this._07P_)
         {
            this._0w4();
         }
         this._07P_ = null;
         this._K_p.visible = false;
         this.rank = 0;
      }
      
      private function _1J_8() : _I_a
      {
         var _loc1_:_I_a = new _I_a();
         _loc1_.setBold(true).setSize(24);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         return _loc1_;
      }
      
      private function _1L_c() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(0,0.5);
         _loc1_.graphics.drawRect(0,0,750,60);
         _loc1_.graphics.endFill();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _0r1() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(5526612);
         _loc1_.graphics.drawRoundRect(0,0,40,40,10,10);
         _loc1_.graphics.endFill();
         _loc1_.visible = false;
         return _loc1_;
      }
      
      private function _1gg(param1:int) : String
      {
         var _loc2_:int = Math.floor(param1 / 60);
         var _loc3_:String = (_loc2_ < 10?"0":"") + _loc2_.toString();
         var _loc4_:int = param1 % 60;
         var _loc5_:String = (_loc4_ < 10?"0":"") + _loc4_.toString();
         return _loc3_ + ":" + _loc5_;
      }
      
      private function align() : void
      {
         this._0L_j.x = 75;
         this._0L_j.y = HEIGHT / 2 - this._0L_j.height / 2;
         this._0B_u.x = 110;
         this._0B_u.y = HEIGHT / 2 - this._0B_u.height / 2 - 3;
         if(this._07P_)
         {
            this._07P_.x = 170;
            this._07P_.y = HEIGHT / 2 - this._07P_.height / 2;
            this._K_p.x = 175;
            this._K_p.y = HEIGHT / 2 - this._K_p.height / 2;
         }
         this.playerName.x = 230;
         this.playerName.y = HEIGHT / 2 - this.playerName.height / 2;
         this.waveNumber.x = 485;
         this.waveNumber.y = HEIGHT / 2 - this.waveNumber.height / 2;
         this._0C_r.x = 635;
         this._0C_r.y = HEIGHT / 2 - this._0C_r.height / 2;
      }
   }
}
