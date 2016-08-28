package _18
{
   import flash.display.Sprite;
   import _ge.StatModel;
   import _C_._1O_I_;
   import _1S_0._1mh;
   import com.company.assembleegameclient.objects.Player;
   import flash.filters.GlowFilter;
   import flash.events.MouseEvent;
   
   public class _0I_h extends Sprite
   {
      
      private static const _0lh:Array = [new StatModel(_1O_I_._0hL_,_1O_I_._1cp,_1O_I_._gn,true),new StatModel(_1O_I_._0eH_,_1O_I_._1D_P_,_1O_I_._1G_,false),new StatModel(_1O_I_._1r7,_1O_I_._G_d,_1O_I_._1kc,true),new StatModel(_1O_I_._02B_,_1O_I_._K_j,_1O_I_._1M_T_,true),new StatModel(_1O_I_._ov,_1O_I_._1gd,_1O_I_._t6,true),new StatModel(_1O_I_._N_K_,_1O_I_._Y_f,_1O_I_._P_a,true)];
      
      public static const _t4:int = 0;
      
      public static const _0q9:int = 1;
      
      public static const _pg:int = 2;
      
      public static const _1fq:int = 3;
      
      public static const _L_1:int = 4;
      
      public static const _0C_T_:int = 5;
      
      public static const _ha:String = "state_undocked";
      
      public static const _0i0:String = "state_docked";
      
      public static const _R_X_:String = _0i0;
       
      
      private const WIDTH:int = 191;
      
      private const HEIGHT:int = 45;
      
      private var background:Sprite;
      
      public var _0O_6:Vector.<_18._1R_C_>;
      
      public var _095:Sprite;
      
      public var _19r:_1mh;
      
      public var _0h6:String = "state_docked";
      
      public function _0I_h()
      {
         this.background = this._0c0();
         this._0O_6 = new Vector.<_18._1R_C_>();
         this._095 = new Sprite();
         super();
         addChild(this.background);
         addChild(this._095);
         this._0Q_9();
         mouseChildren = false;
         this._19r = new _1mh(this,MouseEvent.MOUSE_DOWN,MouseEvent);
      }
      
      private function _0Q_9() : void
      {
         var _loc1_:_18._1R_C_ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _0lh.length)
         {
            _loc1_ = this._1fs(_loc3_,_loc2_);
            this._0O_6.push(_loc1_);
            this._095.addChild(_loc1_);
            _loc2_ = _loc2_ + _loc3_ % 2;
            _loc3_++;
         }
      }
      
      private function _1fs(param1:int, param2:int) : _18._1R_C_
      {
         var _loc3_:_18._1R_C_ = null;
         var _loc4_:StatModel = _0lh[param1];
         _loc3_ = new _18._1R_C_(_loc4_.name,_loc4_._0V_W_,_loc4_.description,_loc4_._lm);
         _loc3_.x = param1 % 2 * this.WIDTH / 2;
         _loc3_.y = param2 * (this.HEIGHT / 3);
         return _loc3_;
      }
      
      public function draw(param1:Player) : void
      {
         if(param1)
         {
            this._0yw();
            this._Q_M_(param1);
         }
         this._095.x = (this.WIDTH - this._095.width) / 2;
      }
      
      private function _Q_M_(param1:Player) : void
      {
         this._0O_6[_t4].draw(param1.attack_,param1.attackBonus_,param1._15v);
         this._0O_6[_0q9].draw(param1.defense_,param1.defenseBonus_,param1._029);
         this._0O_6[_pg].draw(param1.speed_,param1.speedBonus_,param1._0fg);
         this._0O_6[_1fq].draw(param1.dexterity_,param1.dexterityBonus_,param1._I_k);
         this._0O_6[_L_1].draw(param1.vitality_,param1.vitalityBonus_,param1._0A_h);
         this._0O_6[_0C_T_].draw(param1.wisdom_,param1.wisdomBonus_,param1._00c);
      }
      
      public function _0E_E_() : void
      {
         this._0h6 = _0i0;
      }
      
      public function _0W_T_() : void
      {
         this._0h6 = _ha;
      }
      
      private function _0c0() : Sprite
      {
         this.background = new Sprite();
         this.background.graphics.clear();
         this.background.graphics.beginFill(3552822);
         this.background.graphics.lineStyle(2,16777215);
         this.background.graphics.drawRoundRect(-5,-5,this.WIDTH + 10,this.HEIGHT + 13,10);
         this.background.filters = [new GlowFilter(0,1,10,10,1,3)];
         return this.background;
      }
      
      private function _0yw() : void
      {
         if(this._0h6 == _ha)
         {
            this.background.alpha = 1;
         }
         else if(this._0h6 == _0i0)
         {
            this.background.alpha = 0;
         }
      }
   }
}
