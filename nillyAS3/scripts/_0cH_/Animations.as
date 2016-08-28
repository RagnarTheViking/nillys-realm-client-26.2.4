package _0cH_
{
   import flash.display.BitmapData;
   
   public class Animations
   {
       
      
      public var _null_:_0cH_._1O_F_;
      
      public var _1L_e:Vector.<int> = null;
      
      public var _1I_0:RunningAnimation = null;
      
      public function Animations(param1:_0cH_._1O_F_)
      {
         super();
         this._null_ = param1;
      }
      
      public function getTexture(param1:int) : BitmapData
      {
         var _loc2_:_0N_3 = null;
         var _loc3_:BitmapData = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._1L_e == null)
         {
            this._1L_e = new Vector.<int>();
            for each(_loc2_ in this._null_._1v7)
            {
               this._1L_e.push(_loc2_._1W_7(param1));
            }
         }
         if(this._1I_0 != null)
         {
            _loc3_ = this._1I_0.getTexture(param1);
            if(_loc3_ != null)
            {
               return _loc3_;
            }
            this._1I_0 = null;
         }
         while(_loc5_ < this._1L_e.length)
         {
            if(param1 > this._1L_e[_loc5_])
            {
               _loc4_ = this._1L_e[_loc5_];
               _loc2_ = this._null_._1v7[_loc5_];
               this._1L_e[_loc5_] = _loc2_._1I_h(param1);
               if(!(_loc2_._1gb != 1 && Math.random() > _loc2_._1gb))
               {
                  this._1I_0 = new RunningAnimation(_loc2_,_loc4_);
                  return this._1I_0.getTexture(param1);
               }
            }
            _loc5_++;
         }
         return null;
      }
   }
}

import _0cH_._0N_3;
import flash.display.BitmapData;
import _0cH_._0tY_;

class RunningAnimation
{
    
   
   public var animationData_:_0N_3;
   
   public var start_:int;
   
   public var frameId_:int;
   
   public var frameStart_:int;
   
   public var texture_:BitmapData;
   
   function RunningAnimation(param1:_0N_3, param2:int)
   {
      super();
      this.animationData_ = param1;
      this.start_ = param2;
      this.frameId_ = 0;
      this.frameStart_ = param2;
      this.texture_ = null;
   }
   
   public function getTexture(param1:int) : BitmapData
   {
      var _loc2_:_0tY_ = this.animationData_._M_s[this.frameId_];
      while(param1 - this.frameStart_ > _loc2_.time_)
      {
         if(this.frameId_ >= this.animationData_._M_s.length - 1)
         {
            return null;
         }
         this.frameStart_ = this.frameStart_ + _loc2_.time_;
         this.frameId_++;
         _loc2_ = this.animationData_._M_s[this.frameId_];
         this.texture_ = null;
      }
      if(this.texture_ == null)
      {
         this.texture_ = _loc2_._1B_5.getTexture(Math.random() * 100);
      }
      return this.texture_;
   }
}
