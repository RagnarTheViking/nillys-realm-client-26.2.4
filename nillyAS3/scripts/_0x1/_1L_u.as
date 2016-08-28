package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   
   public class _1L_u extends ParticleEffect
   {
       
      
      private var _1T_g:Vector.<_0x1._D_D_>;
      
      private var _05U_:Vector.<_0x1._D_D_>;
      
      private var _4I_:GameObject;
      
      private var _yN_:Number = 0;
      
      private var _0n0:Number = 0;
      
      private var _0Q_M_:_0x1._0wq;
      
      private var bitmapData:BitmapData;
      
      private var _0L_g:Number;
      
      public function _1L_u(param1:_0x1._0wq, param2:GameObject)
      {
         super();
         this._4I_ = param2;
         this._1T_g = new Vector.<_0x1._D_D_>();
         this._05U_ = new Vector.<_0x1._D_D_>();
         this._0Q_M_ = param1;
         if(this._0Q_M_.bitmapFile)
         {
            this.bitmapData = TextureLibrary.getBitmap(this._0Q_M_.bitmapFile,this._0Q_M_.bitmapIndex);
            this.bitmapData = TextureRedrawer.redraw(this.bitmapData,this._0Q_M_.size,true,0);
         }
         else
         {
            this.bitmapData = TextureRedrawer.redrawSolidSquare(this._0Q_M_.color,this._0Q_M_.size);
         }
      }
      
      public static function _E_O_(param1:_0x1._0wq, param2:GameObject) : _1L_u
      {
         return new _1L_u(param1,param2);
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:_0x1._D_D_ = null;
         var _loc5_:_0x1._D_D_ = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc6_:Number = param1 / 1000;
         _loc3_ = param2 / 1000;
         if(this._4I_.map_ == null)
         {
            return false;
         }
         x_ = this._4I_.x_;
         y_ = this._4I_.y_;
         z_ = this._4I_.z_ + this._0Q_M_.zOffset;
         this._0n0 = this._0n0 + _loc3_;
         var _loc7_:Number = this._0Q_M_.rate * this._0n0;
         var _loc8_:int = _loc7_ - this._yN_;
         while(_loc9_ < _loc8_)
         {
            if(this._1T_g.length)
            {
               _loc4_ = this._1T_g.pop();
            }
            else
            {
               _loc4_ = new _0x1._D_D_(this.bitmapData);
            }
            _loc4_.initialize(this._0Q_M_.life + this._0Q_M_.lifeVariance * (2 * Math.random() - 1),this._0Q_M_.speed + this._0Q_M_.speedVariance * (2 * Math.random() - 1),this._0Q_M_.speed + this._0Q_M_.speedVariance * (2 * Math.random() - 1),this._0Q_M_.rise + this._0Q_M_.riseVariance * (2 * Math.random() - 1),z_);
            map_.addObj(_loc4_,x_ + this._0Q_M_.rangeX * (2 * Math.random() - 1),y_ + this._0Q_M_.rangeY * (2 * Math.random() - 1));
            this._05U_.push(_loc4_);
            _loc9_++;
         }
         this._yN_ = this._yN_ + _loc8_;
         while(_loc10_ < this._05U_.length)
         {
            _loc5_ = this._05U_[_loc10_];
            _loc5_._C_7 = _loc5_._C_7 - _loc3_;
            if(_loc5_._C_7 <= 0)
            {
               this._05U_.splice(_loc10_,1);
               map_.removeObj(_loc5_.objectId_);
               _loc10_--;
               this._1T_g.push(_loc5_);
            }
            else
            {
               _loc5_._1Q_1 = _loc5_._1Q_1 + this._0Q_M_.riseAcc * _loc3_;
               _loc5_.x_ = _loc5_.x_ + _loc5_._se * _loc3_;
               _loc5_.y_ = _loc5_.y_ + _loc5_._1qA_ * _loc3_;
               _loc5_.z_ = _loc5_.z_ + _loc5_._1Q_1 * _loc3_;
            }
            _loc10_++;
         }
         return true;
      }
      
      override public function removeFromMap() : void
      {
         var _loc1_:_0x1._D_D_ = null;
         for each(_loc1_ in this._05U_)
         {
            map_.removeObj(_loc1_.objectId_);
         }
         this._05U_ = null;
         this._1T_g = null;
         super.removeFromMap();
      }
   }
}
