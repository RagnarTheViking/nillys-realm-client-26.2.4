package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.util._0xp;
   
   public class _0d7 extends ParticleEffect
   {
       
      
      public var go_:GameObject;
      
      public var color_:int;
      
      public function _0d7(param1:GameObject, param2:int)
      {
         super();
         this.go_ = param1;
         this.color_ = param2;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc4_:int = 0;
         if(this.go_.map_ == null)
         {
            return false;
         }
         x_ = this.go_.x_;
         y_ = this.go_.y_;
         var _loc3_:int = 10;
         while(_loc4_ < _loc3_)
         {
            map_.addObj(new _O_y(100,this.color_,400,0.75,_0xp._0__x(4),_0xp._0__x(4)),x_,y_);
            _loc4_++;
         }
         return false;
      }
   }
}
