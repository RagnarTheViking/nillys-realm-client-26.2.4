package _18
{
   import _113._13g;
   import _1xa._1eo;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class _qP_ extends _13g
   {
       
      
      public var list:_18._0fG_;
      
      public var next:_18._qP_;
      
      public var _ar:_1eo;
      
      public function _qP_(param1:GameObject, param2:_1eo, param3:uint, param4:int, param5:int = 0)
      {
         this._ar = param2;
         super(param1,param3,param4,param5);
         setStringBuilder(param2);
      }
      
      override public function dispose() : void
      {
         this.list.shift();
      }
   }
}
