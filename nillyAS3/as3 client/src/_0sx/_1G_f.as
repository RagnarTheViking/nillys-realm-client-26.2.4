package _0sx
{
   import _0cW_._0r6;
   import _0cW_.Screen3DHelper;
   import _01r._F_1;
   import _01r._0E_9;
   import _01r._1M_r;
   
   public class _1G_f
   {
      
      public static const _E_g:Boolean = true;
      
      public static const _5H_:Boolean = false;
      
      private static var _0D_t:_0sx._1G_f;
       
      
      private var _7:_0r6;
      
      private var _1A_3:_0r6;
      
      public function _1G_f(param1:String = "")
      {
         super();
         if(param1 != "yoThisIsInternal")
         {
            throw new Error("Program3DFactory is a singleton. Use Program3DFactory.getInstance()");
         }
      }
      
      public static function getInstance() : _0sx._1G_f
      {
         if(_0D_t == null)
         {
            _0D_t = new _0sx._1G_f("yoThisIsInternal");
         }
         return _0D_t;
      }
      
      public function dispose() : void
      {
         if(this._7 != null)
         {
            this._7._1O_r().dispose();
         }
         if(this._1A_3 != null)
         {
            this._1A_3._1O_r().dispose();
         }
         _0D_t = null;
      }
      
      public function _10P_(param1:Screen3DHelper, param2:Boolean) : _0r6
      {
         var _loc3_:_0r6 = null;
         switch(param2)
         {
            case _E_g:
               if(this._7 == null)
               {
                  this._7 = param1.createProgram();
                  this._7.upload(new _F_1().getVertexProgram(),new _0E_9().getVertexProgram());
               }
               _loc3_ = this._7;
               break;
            case _5H_:
               if(this._1A_3 == null)
               {
                  this._1A_3 = param1.createProgram();
                  this._1A_3.upload(new _F_1().getVertexProgram(),new _1M_r().getVertexProgram());
               }
               _loc3_ = this._1A_3;
               break;
            default:
               if(this._7 == null)
               {
                  this._7 = param1.createProgram();
                  this._7.upload(new _F_1().getVertexProgram(),new _0E_9().getVertexProgram());
               }
               _loc3_ = this._7;
         }
         return _loc3_;
      }
   }
}
