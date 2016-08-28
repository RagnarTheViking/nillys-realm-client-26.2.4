package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   
   public class HealingEffect extends ParticleEffect
   {
       
      
      public var go_:GameObject;
      
      public var _1gR_:int;
      
      public function HealingEffect(param1:GameObject)
      {
         super();
         this.go_ = param1;
         this._1gR_ = 0;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:_B_E_ = null;
         if(this.go_.map_ == null)
         {
            return false;
         }
         x_ = this.go_.x_;
         y_ = this.go_.y_;
         var _loc7_:int = param1 - this._1gR_;
         if(_loc7_ > 500)
         {
            _loc3_ = 2 * Math.PI * Math.random();
            _loc4_ = (3 + int(Math.random() * 5)) * 20;
            _loc5_ = 0.3 + 0.4 * Math.random();
            _loc6_ = new _B_E_(16777215,Math.random() * 0.3,_loc4_,1000,0.1 + Math.random() * 0.1,this.go_,_loc3_,_loc5_);
            map_.addObj(_loc6_,x_ + _loc5_ * Math.cos(_loc3_),y_ + _loc5_ * Math.sin(_loc3_));
            this._1gR_ = param1;
         }
         return true;
      }
   }
}
