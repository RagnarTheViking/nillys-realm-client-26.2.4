package _0gO_
{
   import flash.display3D.IndexBuffer3D;
   
   public class _1W_5
   {
       
      
      public var name:String;
      
      public var _0vF_:String;
      
      public var _1Q_H_:IndexBuffer3D;
      
      var _0V_r:Vector.<Vector.<String>>;
      
      var _0O_i:Vector.<uint>;
      
      public function _1W_5(param1:String = null, param2:String = null)
      {
         super();
         this.name = param1;
         this._0vF_ = param2;
         this._0V_r = new Vector.<Vector.<String>>();
         this._0O_i = new Vector.<uint>();
      }
      
      public function dispose() : void
      {
         if(this._1Q_H_ != null)
         {
            this._1Q_H_.dispose();
            this._1Q_H_ = null;
         }
         this._0V_r.length = 0;
         this._0O_i.length = 0;
      }
   }
}
