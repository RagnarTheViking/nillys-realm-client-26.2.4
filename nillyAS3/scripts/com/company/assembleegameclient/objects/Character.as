package com.company.assembleegameclient.objects
{
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import com.company.util.GraphicHelper;
   import _V_E_.HWAccelerate;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.parameters.Parameters;
   import _ll.SFX;
   
   public class Character extends GameObject
   {
       
      
      public var _03t:String;
      
      public var _0jV_:String;
      
      private var backgroundFill:Vector.<GraphicsSolidFill> = null;
      
      private var foregroundFill:Vector.<GraphicsSolidFill> = null;
      
      private var backgroundPath:Vector.<GraphicsPath> = null;
      
      private var foregroundPath:Vector.<GraphicsPath> = null;
      
      private var HP_BAR:int = 0;
      
      private var MP_BAR:int = 1;
      
      public function Character(param1:XML)
      {
         super(param1);
         this._03t = !!param1.hasOwnProperty("HitSound")?String(param1.HitSound):"monster/default_hit";
         SFX.load(this._03t);
         this._0jV_ = !!param1.hasOwnProperty("DeathSound")?String(param1.DeathSound):"monster/default_death";
         SFX.load(this._0jV_);
      }
      
      public static function green2red(param1:int) : int
      {
         if(param1 > 50)
         {
            return 65280 + 327680 * int(100 - param1);
         }
         return 16776960 - 1280 * int(50 - param1);
      }
      
      private function drawBar(param1:Vector.<IGraphicsData>, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc11_:* = undefined;
         if(this.foregroundPath == null)
         {
            this.backgroundFill = new Vector.<GraphicsSolidFill>(2,true);
            this.foregroundFill = new Vector.<GraphicsSolidFill>(2,true);
            this.backgroundPath = new Vector.<GraphicsPath>(2,true);
            this.foregroundPath = new Vector.<GraphicsPath>(2,true);
         }
         if(this.foregroundPath[param4] == null)
         {
            this.backgroundFill[param4] = new GraphicsSolidFill(5526612);
            this.foregroundFill[param4] = new GraphicsSolidFill(param5);
            this.backgroundPath[param4] = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
            this.foregroundPath[param4] = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
         }
         var _loc8_:int = int(param2 / param3 * 100);
         if(param4 == this.HP_BAR)
         {
            this.foregroundFill[param4].color = green2red(_loc8_);
         }
         var _loc9_:* = size_ * 0.2;
         var _loc10_:Vector.<Number> = this.backgroundPath[param4].data;
         _loc10_.length = 0;
         _loc10_.push(_P_c[0] - _loc9_,_P_c[1] + param6,_P_c[0] + _loc9_,_P_c[1] + param6,_P_c[0] + _loc9_,_P_c[1] + param6 + param7,_P_c[0] - _loc9_,_P_c[1] + param6 + param7);
         param1.push(this.backgroundFill[param4]);
         param1.push(this.backgroundPath[param4]);
         param1.push(GraphicHelper.END_FILL);
         HWAccelerate.addSolidFill(this.backgroundFill[param4],true);
         if(_loc8_ > 0)
         {
            _loc11_ = _loc8_ / 100 * 2 * _loc9_;
            _loc10_ = this.foregroundPath[param4].data;
            _loc10_.length = 0;
            _loc10_.push(_P_c[0] - _loc9_,_P_c[1] + param6,_P_c[0] - _loc9_ + _loc11_,_P_c[1] + param6,_P_c[0] - _loc9_ + _loc11_,_P_c[1] + param6 + param7,_P_c[0] - _loc9_,_P_c[1] + param6 + param7);
            param1.push(this.foregroundFill[param4]);
            param1.push(this.foregroundPath[param4]);
            param1.push(GraphicHelper.END_FILL);
            HWAccelerate.addSolidFill(this.foregroundFill[param4],true);
         }
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         super.draw(param1,param2,param3);
         if(Parameters.data_["showHpBar"] == false)
         {
            return;
         }
         if(!Parameters.data_.HPBarSafeZone && (map_.gs_.evalIsNotInCombatMapArea() || map_.isPetYard))
         {
            return;
         }
         var _loc4_:Player = this as Player;
         if(_loc4_ != null)
         {
            if(Parameters.data_.HPBarOwn && this == _loc4_.map_.player_ || Parameters.data_.HPBarAlly && this != _loc4_.map_.player_)
            {
               if(Parameters.data_.HPBarMagic)
               {
                  this.drawBar(param1,_loc4_.mp_,_loc4_.maxMp_,this.MP_BAR,49151,1,2);
                  this.drawBar(param1,hp_,maxHp_,this.HP_BAR,255,3,2);
               }
               else
               {
                  this.drawBar(param1,hp_,maxHp_,this.HP_BAR,255,1,4);
               }
               return;
            }
         }
         if(Parameters.data_.HPBarEnemy && this.props_.isEnemy_ && this.maxHp_ != 0)
         {
            this.drawBar(param1,hp_,maxHp_,this.HP_BAR,16711680,3,3);
         }
      }
      
      override public function damage(param1:int, param2:int, param3:Vector.<uint>, param4:Boolean, param5:Projectile) : void
      {
         super.damage(param1,param2,param3,param4,param5);
         if(dying_)
         {
            SFX.play(this._0jV_);
         }
         else
         {
            SFX.play(this._03t);
         }
      }
   }
}
