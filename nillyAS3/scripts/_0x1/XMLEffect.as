package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   
   public class XMLEffect extends ParticleEffect
   {
       
      
      private var go_:GameObject;
      
      private var _dK_:_0x1._m8;
      
      private var _W_L_:Number;
      
      private var _0B_D_:Number;
      
      public function XMLEffect(param1:GameObject, param2:_0wq)
      {
         super();
         this.go_ = param1;
         this._dK_ = ParticalLibrary._01A_[param2.particle];
         this._W_L_ = param2.cooldown;
         this._0B_D_ = 0;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         if(this.go_.map_ == null)
         {
            return false;
         }
         var _loc3_:Number = param2 / 1000;
         this._0B_D_ = this._0B_D_ - _loc3_;
         if(this._0B_D_ >= 0)
         {
            return true;
         }
         this._0B_D_ = this._W_L_;
         map_.addObj(new _1lE_(this._dK_),this.go_.x_,this.go_.y_);
         return true;
      }
   }
}
