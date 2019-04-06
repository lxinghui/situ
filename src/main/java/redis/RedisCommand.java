package redis;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.data.redis.connection.DataType;
import org.springframework.data.redis.core.ZSetOperations;


public interface RedisCommand<K, V> {

    /**
     * �û�����ͨ��ע��ʱ��� Ȩ��ֵ
     * @param date
     * @return
     */
    double getCreateTimeScore(long date);
    /**
     * ��ȡRedis�����еļ���key
     * @return
     */
    Set<K> getAllKeys();

    /**
     * ��ȡ���е���ͨkey-value
     * @return
     */
    Map<K,V> getAllString();

    /**
     * ��ȡ���е�Set -key-value
     * @return
     */
    Map<K,Set<V>> getAllSet();
    /**
     * ��ȡ���е�ZSet����  -key-value ����ȡȨ��ֵ
     * @return
     */
    Map<K,Set<V>> getAllZSetReverseRange();
    /**
     * ��ȡ���е�ZSet����  -key-value ����ȡȨ��ֵ
     * @return
     */
    Map<K,Set<V>> getAllZSetRange();

    /**
     * ��ȡ���е�List -key-value
     * @return
     */
    Map<K,List<V>> getAllList();

    /**
     * ��ȡ���е�Map -key-value
     * @return
     */
    Map<K,Map<K,V>> getAllMap();

    /**
     * ���һ��list
     * @param key
     * @param objectList
     */
    void addList(K key, List<V> objectList);
    /**
     * ��list������ֵ
     * @param key
     * @param obj
     * @return ������list�е��±�
     */
    long addList(K key,V obj);
    /**
     *
     * ��list������ֵ
     * @param key
     * @param obj
     * @return ������list�е��±�
     */
    long addList(K key,V ...obj);

    /**
     *
     * ���list
     * @param key List��key
     * @param s ��ʼ�±�
     * @param e �������±�
     * @return
     */
    List<V> getList(K key, long s, long e);
    /**
     * ���������list
     * @param key
     */
    List<V> getList(K key);
    /**
     * ��ȡlist������Ԫ�صĸ���
     * @param key
     * @return
     */
    long getListSize(K key);
    /**
     * �Ƴ�list��ĳֵ
     * �Ƴ�list�� count��valueΪobject��ֵ,���ҷ����Ƴ�������,
     * ���countΪ0,���ߴ���list��ΪvalueΪobject�������ܺ�,
     * ��ô�Ƴ�����valueΪobject��ֵ,���ҷ����Ƴ�����
     * @param key
     * @param object
     * @return �����Ƴ�����
     */
    long removeListValue(K key,V object);
    /**
     * �Ƴ�list��ĳֵ
     * @param key
     * @param object
     * @return �����Ƴ�����
     */
    long removeListValue(K key,V... object);

    /**
     * ����ɾ��key��Ӧ��value
     * @param keys
     */
    void remove(final K... keys);
    /**
     * ɾ������
     * ����key��ȷƥ��ɾ��
     * @param key
     */
    void remove(final K key);

    /**
     * ͨ������ɾ��ZSet�е�ֵ
     * @param key
     * @param s
     * @param e
     */
    void removeZSetRangeByScore(String key,double s , double e);
    /**
     * ����Set�Ĺ���ʱ��
     * @param key
     * @param time
     * @return
     */
    Boolean setSetExpireTime(String key,Long time);

    /**
     * ����ZSet�Ĺ���ʱ��
     * @param key
     * @param time
     * @return
     */
    Boolean setZSetExpireTime(String key,Long time);
    /**
     * �жϻ������Ƿ���key��Ӧ��value
     * @param key
     * @return
     */
    boolean exists(final K key);

    /**
     * ��ȡString���� �����Ƕ���
     * @param key
     * @return
     */
    V get(final K key);
    /**
     * ��ȡString���� �����Ƕ���
     * @param key
     * @return
     */
    List<V> get(final K... key);
    /**
     * ��ȡ���� �����Ƕ��� ����������ʽƥ��
     * @param regKey
     * @return
     */
    List<Object> getByRegular(final K regKey);


    /**
     * д�뻺�� �����Ƕ���
     * @param key
     * @param value
     */
    void set(final K key, V value);

    /**
     * д�뻺��
     * @param key
     * @param value
     * @param expireTime ����ʱ�� -��λs
     * @return
     */
    void set(final K key, V value, Long expireTime);

    /**
     * ����һ��key�Ĺ���ʱ�䣨��λ���룩
     * @param key
     * @param expireTime
     * @return
     */
    boolean setExpireTime(K key, Long expireTime);

    /**
     * ��ȡkey������
     * @param key
     * @return
     */
    DataType getType(K key);

    /**
     * ɾ��map�е�ĳ������
     * @param key   map��Ӧ��key
     * @param field map�иö����key
     */
    void removeMapField(K key, V... field);
    /*
     * ��ȡmap����
     * @param key map��Ӧ��key
     * @return
     */
    Map<K,V> getMap(K key);
    /*
     * ��ȡmap����
     * @param key map��Ӧ��key
     * @return
     */
    Long getMapSize(K key);
    /**
     * ��ȡmap�����е�ĳ������
     * @param key map��Ӧ��key
     * @param field map�иö����key
     * @return
     */
    <T> T getMapField(K key, K field);
    /**
     * �ж�map�ж�Ӧkey��key�Ƿ����
     * @param key map��Ӧ��key
     * @return
     */
    Boolean hasMapKey(K key,K field);

    /**
     * ��ȡmap��Ӧkey��value
     * @param key map��Ӧ��key
     * @return
     */
    List<V> getMapFieldValue(K key);
    /**
     * ��ȡmap��key
     * @param key map��Ӧ��key
     * @return
     */
    Set<V> getMapFieldKey(K key);
    /**
     * ���map
     * @param key
     * @param map
     */
    void addMap(K key, Map<K,V> map);
    /**
     * ��key��Ӧ��map����ӻ������
     * @param key   cache����key
     * @param field map��Ӧ��key
     * @param value     ֵ
     */
    void addMap(K key, K field, Object value);
    /**
     * ��key��Ӧ��map����ӻ������
     * @param key   cache����key
     * @param field map��Ӧ��key
     * @param time ����ʱ��-����MAP�Ĺ���ʱ��
     * @param value     ֵ
     */
    void addMap(K key, K field, V value,long time);

    /**
     * ��set�м������
     * @param key  ����key
     * @param obj  ֵ
     */
    void addSet(K key, V... obj);

    /**
     * ��������ʱ����key
     * @param key
     */
    void watch(String key);

    /**
     * �Ƴ�set�е�ĳЩֵ
     * @param key  ����key
     * @param obj  ֵ
     */
    long removeSetValue(K key, V obj);
    /**
     * �Ƴ�set�е�ĳЩֵ
     * @param key  ����key
     * @param obj  ֵ
     */
    long removeSetValue(K key, V... obj);

    /**
     * ��ȡset�Ķ�����
     * @param key  ����key
     */
    long getSetSize(K key);

    /**
     * �ж�set���Ƿ�������ֵ
     * @param key  ����key
     */
    Boolean hasSetValue(K key,V obj);
    /**
     * �������set
     * @param key  ����key
     */
    Set<V> getSet(K key);

    /**
     * ���set ����
     * @param key
     * @param otherKey
     * @return
     */
    Set<V> getSetUnion(K key,K otherKey);

    /**
     * ���set ����
     * @param key
     * @param set
     * @return
     */
    Set<V> getSetUnion(K key,Set<Object> set);

    /**
     * ���set ����
     * @param key
     * @param otherKey
     * @return
     */
    Set<V> getSetIntersect(K key,K otherKey);

    /**
     * ���set ����
     * @param key
     * @param set
     * @return
     */
    Set<V> getSetIntersect(K key,Set<Object> set);

    /**
     * ģ���Ƴ� ֧��*�ŵ�ƥ���Ƴ�
     * @param blears
     */
    void removeBlear(K... blears);

    /**
     * �޸�key�� ��������ڸ�key����û���޸ĳɹ�����false
     * @param oldKey
     * @param newKey
     * @return
     */
    Boolean renameIfAbsent(String oldKey,String newKey);
    /**
     * ģ���Ƴ� ֧��*�ŵ�ƥ���Ƴ�
     * @param blear
     */
    void removeBlear(K blear);

    /**
     * ����������ʽ���Ƴ�key-value
     * @param blears
     */
    void removeByRegular(String... blears);

    /**
     * ����������ʽ���Ƴ�key-value
     * @param blears
     */
    void removeByRegular(String blears);

    /**
     * ����������ʽ���Ƴ� Map�е�key-value
     * @param key
     * @param blears
     */
    void removeMapFieldByRegular(K key,K... blears);

    /**
     * ����������ʽ���Ƴ� Map�е�key-value
     * @param key
     * @param blear
     */
    void removeMapFieldByRegular(K key,K blear);

    /**
     * �Ƴ�key ��Ӧ��value
     * @param key
     * @param value
     * @return
     */
    Long removeZSetValue(K key, V... value);
    /**
     * �Ƴ�key ZSet
     * @param key
     * @return
     */
    void removeZSet(K key);
    /**
     *ɾ������ΪK�ļ��ϣ�����start<=index<=end��Ԫ���Ӽ�
     * @param key
     * @param start
     * @param end
     * @return
     */
    void removeZSetRange(K key,Long start,Long end);

    /**
     * ���� ��key��Ӧ�ļ��Ϻ�key1��Ӧ�ļ��Ϻϲ���key2��
     * ���������ͬ��ֵ�����ᱣ��
     * ԭ��key2��ֵ�ᱻ����
     * @param key
     * @param key1
     * @param key2
     */
    void setZSetUnionAndStore(String key,String key1, String key2);

    /**
     * ��ȡ�������򼯺�ZSET������
     * @param key
     */
    <T> T getZSetRange(K key);

    /**
     * ��ȡ���򼯺�ZSET
     * ��ΪK�ļ��ϣ�����start<=index<=end��Ԫ���Ӽ�������
     * @param key
     * @param start ��ʼλ��
     * @param end ����λ��
     */
    <T> T getZSetRange(K key,long start,long end);
    /**
     * ��ȡ�������򼯺�ZSET������
     * @param key
     */
    Set<Object> getZSetReverseRange(K key);

    /**
     * ��ȡ���򼯺�ZSET
     * ��ΪK�ļ��ϣ�����start<=index<=end��Ԫ���Ӽ�������
     * @param key
     * @param start ��ʼλ��
     * @param end ����λ��
     */
    Set<V> getZSetReverseRange(K key,long start,long end);

    /**
     * ͨ������(Ȩֵ)��ȡZSET���� ���� -��С����
     * @param key
     * @param start
     * @param end
     * @return
     */
    Set<V> getZSetRangeByScore(String key, double start, double end);

    /**
     * ͨ������(Ȩֵ)��ȡZSET���� ���� -�Ӵ�С
     * @param key
     * @param start
     * @param end
     * @return
     */
    Set<V> getZSetReverseRangeByScore(String key, double start, double end);

    /**
     * ��ΪK�ļ��ϣ�����start<=index<=end��Ԫ���Ӽ�
     * ���ط��ͽӿڣ�����score��value��������
     * @param key
     * @param start
     * @param end
     * @return
     */
    Set<ZSetOperations.TypedTuple<V>> getZSetRangeWithScores(K key, long start, long end);
    /**
     * ��ΪK�ļ��ϣ�����start<=index<=end��Ԫ���Ӽ�
     * ���ط��ͽӿڣ�����score��value��������
     * @param key
     * @param start
     * @param end
     * @return
     */
    Set<ZSetOperations.TypedTuple<V>> getZSetReverseRangeWithScores(K key, long start, long end);

    /**
     * ��ΪK�ļ���
     * ���ط��ͽӿڣ�����score��value��������
     * @param key
     * @return
     */
    Set<ZSetOperations.TypedTuple<V>> getZSetRangeWithScores(K key);
    /**
     * ��ΪK�ļ���
     * ���ط��ͽӿڣ�����score��value��������
     * @param key
     * @return
     */
    Set<ZSetOperations.TypedTuple<V>> getZSetReverseRangeWithScores(K key);

    /**
     * ��ΪK�ļ��ϣ�sMin<=score<=sMax��Ԫ�ظ���
     * @param key
     * @param sMin
     * @param sMax
     * @return
     */
    long getZSetCountSize(K key,double sMin,double sMax);

    /**
     * ��ȡZset ��ΪK�ļ���Ԫ�ظ���
     * @param key
     * @return
     */
    long getZSetSize(K key);

    /**
     * ��ȡ��ΪK�ļ��ϣ�valueΪobj��Ԫ�ط���
     * @param key
     * @param value
     * @return
     */
    double getZSetScore(K key,V value);

    /**
     * Ԫ�ط������ӣ�delta������
     * @param key
     * @param value
     * @param delta
     * @return
     */
    double incrementZSetScore(K key,V value,double delta);

    /**
     * ������򼯺�ZSET
     * Ĭ�ϰ���score�������У��洢��ʽK(1)==V(n)��V(1)=S(1)
     * @param key
     * @param score
     * @param value
     * @return
     */
    Boolean addZSet(String key ,double score, Object value);

    /**
     * ������򼯺�ZSET
     * @param key
     * @param value
     * @return
     */
    Long addZSet(K key,TreeSet<V> value);

    /**
     * ������򼯺�ZSET
     * @param key
     * @param score
     * @param value
     * @return
     */
    Boolean addZSet(K key,double[] score, Object[] value);



}
