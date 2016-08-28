package _Y_8
{
   import flash.display.Sprite;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import _05L_._05T_;
   
   public class _0Y_d extends Sprite
   {
       
      
      private const timer:Timer = new Timer(1000);
      
      private const _1op:Vector.<_Y_8._nn> = new Vector.<_Y_8._nn>();
      
      private var _X_u:Vector.<_Y_8._nn>;
      
      private var _wT_:Vector.<_Y_8._nn>;
      
      private var _eS_:int;
      
      private var index:int;
      
      private var _w9:Boolean;
      
      private var _0l__:Boolean = false;
      
      private var _6L_:int;
      
      public function _0Y_d(param1:int = 7, param2:uint = 150)
      {
         super();
         mouseEnabled = true;
         mouseChildren = true;
         this._X_u = new Vector.<_Y_8._nn>();
         this._wT_ = new Vector.<_Y_8._nn>();
         this._eS_ = param1;
         this._6L_ = param2;
         this.index = 0;
         this._w9 = true;
         this.timer.addEventListener(TimerEvent.TIMER,this._0G_u);
         this.timer.start();
      }
      
      private function _0G_u(param1:TimerEvent) : void
      {
         var _loc2_:_Y_8._nn = null;
         var _loc3_:_Y_8._nn = null;
         for each(_loc2_ in this._wT_)
         {
            if(_loc2_._0P_P_() && !this._0l__)
            {
               this._1op.push(_loc2_);
               continue;
            }
            break;
         }
         while(this._1op.length > 0)
         {
            this._1D_4(this._1op.pop());
            if(!this._w9)
            {
               _loc3_ = this._X_u[this.index++];
               if(!_loc3_._0P_P_())
               {
                  this._04J_(_loc3_);
                  this._w9 = this.index == this._X_u.length;
                  this._0F_N_();
               }
            }
         }
      }
      
      public function setup(param1:_05T_) : void
      {
         this._eS_ = param1._eS_;
      }
      
      public function _1iO_(param1:_Y_8._nn) : void
      {
         var _loc2_:_Y_8._nn = null;
         if(this._X_u.length > this._6L_)
         {
            _loc2_ = this._X_u.shift();
            this._1D_4(_loc2_);
            this.index--;
            if(!this._w9 && this.index < this._eS_)
            {
               this._0V_();
            }
         }
         this._X_u.push(param1);
         if(this._w9)
         {
            this._1cB_(param1);
         }
      }
      
      private function _1D_4(param1:_Y_8._nn) : void
      {
         var _loc2_:int = this._wT_.indexOf(param1);
         if(_loc2_ != -1)
         {
            removeChild(param1);
            this._wT_.splice(_loc2_,1);
            this._w9 = this.index == this._X_u.length;
         }
      }
      
      private function _1cB_(param1:_Y_8._nn) : void
      {
         this.index++;
         this._04J_(param1);
         this._0nc();
         this._0F_N_();
      }
      
      public function _1hf() : void
      {
         if(this._0l__ && this._1Z_t())
         {
            this._1cM_();
         }
         else
         {
            this._wa();
         }
         this._0l__ = true;
      }
      
      public function _wa() : void
      {
         var _loc1_:_Y_8._nn = null;
         var _loc2_:int = this.index - this._wT_.length - 1;
         var _loc3_:int = Math.max(0,this.index - this._eS_ - 1);
         var _loc4_:int = _loc2_;
         while(_loc4_ > _loc3_)
         {
            _loc1_ = this._X_u[_loc4_];
            if(this._wT_.indexOf(_loc1_) == -1)
            {
               this._V_e(_loc1_);
            }
            _loc4_--;
         }
         this._0F_N_();
      }
      
      public function _5K_() : void
      {
         if(this._0l__)
         {
            this._0l__ = false;
            this._1U_e();
            this._0G_u(null);
         }
         if(!this._w9)
         {
            this._1nI_();
         }
         else if(this._0l__)
         {
            this._0l__ = false;
         }
      }
      
      public function _1U_e() : void
      {
         while(!this._w9)
         {
            this._1nI_();
         }
      }
      
      public function _H_H_() : void
      {
         var _loc1_:int = 0;
         if(!this._0l__)
         {
            this._wa();
            this._0l__ = true;
         }
         else
         {
            _loc1_ = 0;
            while(_loc1_ < this._eS_)
            {
               if(this._1Z_t())
               {
                  this._1cM_();
                  _loc1_++;
                  continue;
               }
               return;
            }
         }
      }
      
      public function _0V_() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._eS_)
         {
            if(!this._w9)
            {
               this._1nI_();
               _loc1_++;
               continue;
            }
            this._0l__ = false;
            return;
         }
      }
      
      private function _04J_(param1:_Y_8._nn) : void
      {
         this._wT_.push(param1);
         addChild(param1);
      }
      
      private function _0nc() : void
      {
         if(this._wT_.length > this._eS_)
         {
            removeChild(this._wT_.shift());
         }
      }
      
      private function _1Z_t() : Boolean
      {
         return this.index > this._eS_;
      }
      
      private function _1cM_() : void
      {
         var _loc1_:_Y_8._nn = this._X_u[--this.index - this._eS_];
         this._V_e(_loc1_);
         this._0xx();
         this._0F_N_();
         this._w9 = false;
      }
      
      private function _1nI_() : void
      {
         if(this.index < 0)
         {
            this.index = 0;
         }
         var _loc1_:_Y_8._nn = this._X_u[this.index];
         this.index++;
         this._04J_(_loc1_);
         this._0nc();
         this._w9 = this.index == this._X_u.length;
         this._0F_N_();
      }
      
      private function _V_e(param1:_Y_8._nn) : void
      {
         this._wT_.unshift(param1);
         addChild(param1);
      }
      
      private function _0xx() : void
      {
         if(this._wT_.length > this._eS_)
         {
            removeChild(this._wT_.pop());
         }
      }
      
      private function _0F_N_() : void
      {
         var _loc1_:_Y_8._nn = null;
         var _loc2_:int = 0;
         var _loc3_:int = this._wT_.length;
         while(_loc3_--)
         {
            _loc1_ = this._wT_[_loc3_];
            _loc1_.y = _loc2_;
            _loc2_ = _loc2_ - _loc1_.height;
         }
      }
   }
}
