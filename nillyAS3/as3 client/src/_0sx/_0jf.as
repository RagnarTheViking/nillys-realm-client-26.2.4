package _0sx
{
   import _i__._0__L_;
   import _0cW_._054;
   import _wi.Injector;
   import flash.utils.Dictionary;
   import _0cW_.Screen3DHelper;
   
   public class _0jf implements _0__L_
   {
      
      private static const _gA_:int = 6;
       
      
      private var _1Q_H_:_054;
      
      public function _0jf(param1:Screen3DHelper)
      {
         super();
         var _loc2_:Vector.<uint> = Vector.<uint>([0,1,2,2,1,3]);
         if(param1 != null)
         {
            this._1Q_H_ = param1.createIndexBuffer(_gA_);
            this._1Q_H_.uploadFromVector(_loc2_,0,_gA_);
         }
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this._1Q_H_;
      }
      
      public function destroy() : void
      {
      }
   }
}
