package _05g
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.ui.StatusBar;
   import com.company.assembleegameclient.ui._0ed;
   import com.company.assembleegameclient.objects.Player;
   import _C_._1O_I_;
   import flash.events.Event;
   
   public class _0F_q extends Sprite
   {
       
      
      private var _19j:StatusBar;
      
      private var _xd:StatusBar;
      
      private var _Q_m:StatusBar;
      
      private var _0P_p:StatusBar;
      
      private var _uJ_:Boolean;
      
      private var _0mg:int;
      
      private var _04i:_0ed;
      
      public function _0F_q()
      {
         super();
         this._19j = new StatusBar(176,16,5931045,5526612,_1O_I_._0M_s);
         this._xd = new StatusBar(176,16,14835456,5526612,_1O_I_._0h0);
         this._Q_m = new StatusBar(176,16,14693428,5526612,_1O_I_._0t9);
         this._0P_p = new StatusBar(176,16,6325472,5526612,_1O_I_._F_u);
         this._Q_m.y = 24;
         this._0P_p.y = 48;
         this._19j.visible = true;
         this._xd.visible = false;
         addChild(this._19j);
         addChild(this._xd);
         addChild(this._Q_m);
         addChild(this._0P_p);
      }
      
      public function update(param1:Player) : void
      {
         this._19j._4G_(_1O_I_._0M_s,{"level":param1.level_});
         if(param1.level_ != 20)
         {
            if(this._04i)
            {
               this._04i.update(param1.xpBoostTime_);
            }
            if(!this._19j.visible)
            {
               this._19j.visible = true;
               this._xd.visible = false;
            }
            this._19j.draw(param1.exp_,param1.expGoal_,0);
            if(this._0mg != param1.xpBoost_)
            {
               this._0mg = param1.xpBoost_;
               if(this._0mg)
               {
                  this._19j._0H_K_();
               }
               else
               {
                  this._19j._0I_R_();
               }
            }
            if(param1.xpBoostTime_)
            {
               if(!this._uJ_)
               {
                  this._19j.addEventListener("MULTIPLIER_OVER",this._0);
                  this._19j.addEventListener("MULTIPLIER_OUT",this._0E_4);
                  this._uJ_ = true;
               }
            }
            else
            {
               if(this._uJ_)
               {
                  this._19j.removeEventListener("MULTIPLIER_OVER",this._0);
                  this._19j.removeEventListener("MULTIPLIER_OUT",this._0E_4);
                  this._uJ_ = false;
               }
               if(this._04i && this._04i.parent)
               {
                  removeChild(this._04i);
                  this._04i = null;
               }
            }
         }
         else
         {
            if(!this._xd.visible)
            {
               this._xd.visible = true;
               this._19j.visible = false;
            }
            this._xd.draw(param1.fame_,param1.fameGoal_,0);
         }
         this._Q_m.draw(param1.hp_,param1.maxHp_,param1.hpBonus_,param1._1S_q);
         this._0P_p.draw(param1.mp_,param1.maxMp_,param1.mpBonus_,param1._z2);
      }
      
      private function _0(param1:Event) : void
      {
         addChild(this._04i = new _0ed());
      }
      
      private function _0E_4(param1:Event) : void
      {
         if(this._04i && this._04i.parent)
         {
            removeChild(this._04i);
            this._04i = null;
         }
      }
   }
}
