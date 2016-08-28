package _0sx
{
   import _i__._0__L_;
   import _0cW_._0iA_;
   import _wi.Injector;
   import flash.utils.Dictionary;
   import _0cW_.Screen3DHelper;
   
   public class _0__8 implements _0__L_
   {
       
      
      private var _1uG_:_0iA_;
      
      public function _0__8(param1:Screen3DHelper)
      {
         super();
         var _loc2_:Vector.<Number> = Vector.<Number>([-0.5,0.5,0,0,0,0.5,0.5,0,1,0,-0.5,-0.5,0,0,1,0.5,-0.5,0,1,1]);
         this._1uG_ = param1.createVertexBuffer(4,5);
         this._1uG_.uploadFromVector(_loc2_,0,4);
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this._1uG_;
      }
      
      public function destroy() : void
      {
      }
   }
}
